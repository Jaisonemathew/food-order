<?php include('partials/menu.php'); ?>

<div class="main-content">
    <div class="wrapper">
        <h1>Update User</h1>

        <br><br>

        <?php 
            //1. Get the ID of Selected Admin
            $id=$_GET['id'];

            //2. Create SQL Query to Get the Details
            $sql="SELECT * FROM users WHERE id=$id";

            //Execute the Query
            $res=mysqli_query($conn, $sql);

            //Check whether the query is executed or not
            if($res==true)
            {
                // Check whether the data is available or not
                $count = mysqli_num_rows($res);
                //Check whether we have user data or not
                if($count==1)
                {
                    // Get the Details
                    //echo "User Available";
                    $row=mysqli_fetch_assoc($res);

                    $full_name = $row['customer_name'];
                    $username = $row['username'];
                    $customer_email= $row['customer_email'];
                    $customer_contact= $row['customer_contact'];
                    $customer_address= $row['customer_address'];

                }
                else
                {
                    //Redirect to Manage User PAge
                    header('location:'.SITEURL.'admin/manage-users.php');
                }
            }
        
        ?>


        <form action="" method="POST">

            <table class="tbl-30">
                <tr>
                    <td>Full Name: </td>
                    <td>
                        <input type="text" name="customer_name" value="<?php echo $full_name; ?>">
                    </td>
                </tr>

                <tr>
                    <td>Username: </td>
                    <td>
                        <input type="text" name="username" value="<?php echo $username; ?>">
                    </td>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td>
                        <input type="text" name="customer_email" value="<?php echo $customer_email; ?>">
                    </td>
                </tr>
                <tr>
                    <td>Contact: </td>
                    <td>
                        <input type="text" name="customer_contact" value="<?php echo $customer_contact; ?>">
                    </td>
                </tr>
                <tr>
                    <td>Address: </td>
                    <td>
                        <input type="text" name="customer_address" value="<?php echo $customer_address; ?>">
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <input type="hidden" name="id" value="<?php echo $id; ?>">
                        <input type="submit" name="submit" value="Update User" class="btn-secondary">
                    </td>
                </tr>

            </table>

        </form>
    </div>
</div>

<?php 

    //Check whether the Submit Button is Clicked or not
    if(isset($_POST['submit']))
    {
        //echo "Button CLicked";
        //Get all the values from form to update
        $id = $_POST['id'];
        $full_name = $_POST['customer_name'];
        $username = $_POST['username'];
        $customer_email= $_POST['customer_email'];
        $customer_contact= $_POST['customer_contact'];
        $customer_address= $_POST['customer_address'];


        //Create a SQL Query to Update user
        $sql = "UPDATE users SET
        customer_name = '$full_name',
        username = '$username',customer_email = '$customer_email', customer_contact = ' $customer_contact',
        customer_address ='$customer_address'
        WHERE id='$id' ";

        //Execute the Query
        $res = mysqli_query($conn, $sql);

        //Check whether the query executed successfully or not
        if($res==true)
        {
            //Query Executed and user Updated
            $_SESSION['update'] = "<div class='success'>User Updated Successfully.</div>";
            //Redirect to Manage Admin Page
            header('location:'.SITEURL.'admin/manage-users.php');
        }
        else
        {
            //Failed to Update user
            $_SESSION['update'] = "<div class='error'>Failed to Update Admin.</div>";
            //Redirect to Manage user Page
            header('location:'.SITEURL.'admin/manage-update.php');
        }
    }

?>


<?php include('partials/footer.php'); ?>