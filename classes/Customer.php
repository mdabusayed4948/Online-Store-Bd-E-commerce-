<?php
  $filepath = realpath(dirname(__FILE__));
  include_once ($filepath.'/../lib/Database.php') ;
  include_once ($filepath.'/../helpers/Format.php') ;
 ?>
<?php
	/**
	* User Class
	*/
	class Customer{
		
		private $db;
	  	private $fm;
	
	 	public function __construct(){
	 		$this->db = new Database();
	 		$this->fm = new Format();
	 	}

	 	public function customerRegistration($data){
	 		$name = $this->fm->validation($data['name']);
			$name = mysqli_real_escape_string($this->db->link,$name);

			$city = $this->fm->validation($data['city']);
			$city = mysqli_real_escape_string($this->db->link,$city);

			$zip = $this->fm->validation($data['zip']);
			$zip = mysqli_real_escape_string($this->db->link,$zip);

			$email = $this->fm->validation($data['email']);
			$email = mysqli_real_escape_string($this->db->link,$email);

			$address = $this->fm->validation($data['address']);
			$address = mysqli_real_escape_string($this->db->link,$address);

			$country = $this->fm->validation($data['country']);
			$country = mysqli_real_escape_string($this->db->link,$country);

			$phone = $this->fm->validation($data['phone']);
			$phone = mysqli_real_escape_string($this->db->link,$phone);

			$pass = $this->fm->validation($data['pass']);
			$pass = mysqli_real_escape_string($this->db->link,md5($pass));

			if ($name == "" || $city == "" || $zip == "" || $email == "" || $address == "" || $country == "" || $phone == "" || $pass == "") {
    		$msg = "<span class='error'> Fields must not be empty !</span>";
 			return $msg;
	    }
	    $mailquery = "SELECT * FROM tbl_customer WHERE email = '$email' LIMIT 1";
	    $mailchk = $this->db->select($mailquery);
	    if ($mailchk !=false) {
	    	$msg = "<span class='error'>Email already Exists!</span>";
 			return $msg;
	    }else{
	    	 $query = "INSERT INTO  tbl_customer(name,city,zip,email,address,country,phone,pass) VALUES('$name','$city','$zip','$email','$address','$country','$phone','$pass')";
    	 $inserted_row = $this->db->insert($query);
 			if ($inserted_row) {
 				$msg = "<span class='success'>Customer data Inserted Successfully</span>";
 				return $msg;
 			}else{
 				$msg = "<span class='error'>Customer data Not Inserted </span>";
 				return $msg;
 			}
	    }
	 	}

	 	public function customerLogin($data){
	 		$email = $this->fm->validation($data['email']);
			$email = mysqli_real_escape_string($this->db->link,$email);

			$pass = $this->fm->validation($data['pass']);
			$pass = mysqli_real_escape_string($this->db->link,md5($pass));

			if (empty($email) || empty($pass)) {
				$msg = "<span class='error'> Fields must not be empty !</span>";
 				return $msg;
			}

			$query = "SELECT * FROM tbl_customer WHERE email = '$email' AND pass = '$pass' ";
			$result = $this->db->select($query);
			if ($result != false) {
				$value = $result->fetch_assoc();
				Session::set("cuslogin", true);
				Session::set("cmrId", $value['id']);
				Session::set("cmrName",$value['name']);
				header("Location:cart.php");
			}else{
				$msg = "<span class='error'>Email or Password not Match !</span>";
 				return $msg;	
			}
	 	}

	 	public function getCustomerData($id){
	 		$query = "SELECT * FROM tbl_customer WHERE id = '$id'";
	 		$result = $this->db->select($query);
	 		return($result);
	 	}

	 	public function customerUpdate($data, $cmrId){
	 		$name = $this->fm->validation($data['name']);
			$name = mysqli_real_escape_string($this->db->link,$name);

			$city = $this->fm->validation($data['city']);
			$city = mysqli_real_escape_string($this->db->link,$city);

			$zip = $this->fm->validation($data['zip']);
			$zip = mysqli_real_escape_string($this->db->link,$zip);

			$email = $this->fm->validation($data['email']);
			$email = mysqli_real_escape_string($this->db->link,$email);

			$address = $this->fm->validation($data['address']);
			$address = mysqli_real_escape_string($this->db->link,$address);

			$country = $this->fm->validation($data['country']);
			$country = mysqli_real_escape_string($this->db->link,$country);

			$phone = $this->fm->validation($data['phone']);
			$phone = mysqli_real_escape_string($this->db->link,$phone);

			

			if ($name == "" || $city == "" || $zip == "" || $email == "" || $address == "" || $country == "" || $phone == "") {
    		$msg = "<span class='error'> Fields must not be empty !</span>";
 			return $msg;
	    }else{
 			$query = "UPDATE tbl_customer
			SET
			name     = '$name',
			city     = '$city',
			zip      = '$zip',
			email    = '$email',
			address  = '$address',
			country  = '$country',
			phone    = '$phone'
			WHERE id = '$cmrId'";

		$updated_row = $this->db->update($query);
			if ($updated_row) {
 				$msg = "<span class='success'>Customer Data Updated Successfully</span>";
 				return $msg;
 			}else{
 				$msg = "<span class='error'>Customer Data Not Updated Successfully. </span>";
 				return $msg;
 			}
	    }
	 	}
	}
?>