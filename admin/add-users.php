<?php include('partials/menu.php'); ?>

<div class="main-content">
    <div class="wrapper">
        <h1>Add User</h1>

        <br><br>

        <?php 
            if(isset($_SESSION['add'])) //Checking whether the SEssion is Set of Not
            {
                echo $_SESSION['add']; //Display the SEssion Message if SEt
                unset($_SESSION['add']); //Remove Session Message
            }
        ?>

        <form action="" method="POST">

            <table class="tbl-30">
                <tr>
                    <td>Username: </td>
                    <td>
                        <input type="text" name="username" placeholder="User name">
                    </td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td>
                        <input type="password" name="password" placeholder="User Password">
                    </td>
                </tr>
                <tr>
                    <td>Full Name: </td>
                    <td>
                        <input type="text" name="customer_name" placeholder="Full Name">
                    </td>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td>
                        <input type="text" name="customer_email" placeholder="User email">
                    </td>
                </tr>
                <tr>
                    <td>Contact: </td>
                    <td>
                        <input type="text" name="customer_contact" placeholder="User contact">
                    </td>
                </tr>
                <tr>
                    <td>Address: </td>
                    <td>
                        <input type="text" name="customer_address" placeholder="User address">
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <input type="submit" name="submit" value="Add User" class="btn-secondary">
                    </td>
                </tr>

            </table>

        </form>


    </div>
</div>

<?php include('partials/footer.php'); ?>


<?php 
    //Process the Value from Form and Save it in Database

    //Check whether the submit button is clicked or not

    if(isset($_POST['submit']))
    {
        // Button Clicked
        //echo "Button Clicked";

        //1. Get the Data from form
      
        $hash = ($_POST['password']);
        $password= password_hash($hash, 
        PASSWORD_DEFAULT); 
        $full_name = $_POST['customer_name'];
        $username = $_POST['username'];
        $customer_email= $_POST['customer_email'];
        $customer_contact= $_POST['customer_contact'];
        $customer_address= $_POST['customer_address'];


        //2. SQL Query to Save the data into database
        $sql = "INSERT INTO `users` ( `username`, 
        `password`,`customer_name`,`customer_email`,`customer_contact`,`customer_address`,`created_at`) VALUES ('$username', 
        '$password','$full_name','$customer_email','$customer_contact','$customer_address', current_timestamp())";
 
        //3. Executing Query and Saving Data into Datbase
        $res = mysqli_query($conn, $sql) or die(mysqli_error());

        //4. Check whether the (Query is Executed) data is inserted or not and display appropriate message
        if($res==TRUE)
        {
            //Data Inserted
            //echo "Data Inserted";
            //Create a Session Variable to Display Message
            $_SESSION['add'] = "<div class='success'>User Added Successfully.</div>";
            //Redirect Page to Manage Admin
            header("location:".SITEURL.'admin/manage-users.php');
        }
        else
        {
            //FAiled to Insert DAta
            //echo "Faile to Insert Data";
            //Create a Session Variable to Display Message
            $_SESSION['add'] = "<div class='error'>Failed to Add User.</div>";
            //Redirect Page to Add Admin
            header("location:".SITEURL.'admin/add-users.php');
        }

    }
    
?>