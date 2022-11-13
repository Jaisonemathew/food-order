
<?php include('partials-front/menu.php'); ?>

<?php 
    //CHeck whether food id is set or not
    if(isset($_GET['food_id']))
    {
        //Get the Food id and details of the selected food
        $food_id = $_GET['food_id'];

        //Get the DEtails of the SElected Food
        $sql = "SELECT * FROM tbl_food WHERE id=$food_id";
        //Execute the Query
        $res = mysqli_query($conn, $sql);
        //Count the rows
        $count = mysqli_num_rows($res);
        //CHeck whether the data is available or not
        if($count==1)
        {
            //WE Have DAta
            //GEt the Data from Database
            $row = mysqli_fetch_assoc($res);

            $title = $row['title'];
            $price = $row['price'];
            $image_name = $row['image_name'];
        }
        else
        {
            //Food not Availabe
            //REdirect to Home Page
            header('location:'.SITEURL);
        }
    }
    else
    {
        //Redirect to homepage
        header('location:'.SITEURL);
    }
?>

<!-- fOOD sEARCH Section Starts Here -->
<section class="food-order">
    <div class="container">        
        <h2 class="text-center text-white">Please confirm to place order</h2>

        <form action="" method="POST" class="order">
            <fieldset>
                <legend style="color:white;">Selected Food</legend>

                <div class="food-menu-img">
                    <?php 
                    
                        //CHeck whether the image is available or not
                        if($image_name=="")
                        {
                            //Image not Availabe
                            echo "<div class='error'>Image not Available.</div>";
                        }
                        else
                        {
                            //Image is Available
                            ?>
                            <img src="<?php echo SITEURL; ?>images/food/<?php echo $image_name; ?>" alt="Chicke Hawain Pizza" class="img-responsive img-curve">
                            <?php
                        }
                    
                    ?>
                    
                </div>

                <div class="food-menu-desc">
                    <h3 style="color:white;"><?php echo $title; ?></h3>
                    <input type="hidden" name="food" value="<?php echo $title; ?>">

                    <p class="food-price" style="color:white;">₹<?php echo $price; ?></p>
                    <input type="hidden" name="price" value="<?php echo $price; ?>">

                    <div class="order-label" style="color:white;">Quantity</div>
                    <input type="number" name="qty" class="input-responsive" value="1" required>
                    
                </div>

            </fieldset>
            
            <fieldset>
                <input type="submit" name="submit" value="Confirm Order" class="btn btn-primary">
            </fieldset>

        </form>

        <?php 

            //CHeck whether submit button is clicked or not
            if(isset($_POST['submit']))
            {
                if(empty($_SESSION["u_id"]))
{
header('location:login.php');
}
else{
  // Get all the details from the form

  $food = $_POST['food'];
  $price = $_POST['price'];
  $qty = $_POST['qty'];

  $total = $price * $qty; // total = price x qty 

  $order_date = date("Y-m-d h:i:sa"); //Order DAte

  $status = "Ordered";  // Ordered, On Delivery, Delivered, Cancelled
  $u_id=$_SESSION["u_id"];
  



  //Save the Order in Databaase
  //Create SQL to save the data
  $sql2 = "INSERT INTO tbl_order SET 
      food = '$food',
      price = $price,
      qty = $qty,
      total = $total,
      order_date = '$order_date',
      status = '$status',
      u_id='$u_id'
       ";

  //echo $sql2; die();

  //Execute the Query
  $res2 = mysqli_query($conn, $sql2);

  //Check whether query executed successfully or not
  if($res2==true)
  {
      //Query Executed and Order Saved
      
      $_SESSION['order'] = "<div class='success text-center'>Food Ordered Successfully.</div>";
      header('location:'.SITEURL);
  }
  else
  {
      //Failed to Save Order
      $_SESSION['order'] = "<div class='error text-center'>Failed to Order Food.</div>";
      header('location:'.SITEURL);
  }
}
            }
        ?>

    </div>
</section>
<!-- fOOD sEARCH Section Ends Here -->

<?php include('partials-front/footer.php'); ?>