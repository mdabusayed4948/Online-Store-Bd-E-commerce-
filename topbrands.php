<?php include 'inc/header.php';?>	

 <div class="main">
    <div class="content">
    	<div class="content_top">
    		<div class="heading">
    		<h3>Acer</h3>
    		</div>
    		<div class="clear"></div>
    	</div>
	       <div class="section group">
	      <?php
	      	$getAcerpd = $pd->getAcerProduct();
	      	if ($getAcerpd) {
	      		while ($result = $getAcerpd->fetch_assoc()) {
	      			
	      ?>
	     
				<div class="grid_1_of_4 images_1_of_4">
					 <a href="details.php?proid=<?php echo $result['productId']?>"><img src="admin/<?php echo $result['image']?>" alt="" /></a>
					 <h2><?php echo $result['productName']?> </h2>
					 <p>
					 <?php echo $fm->textShorten($result['body'],60);?>
					 </p>
					 <p><span class="price">$<?php echo $result['price']?></span></p>
					 <style>
					 	.myspan{ width: 100px; float: left; }
					 	
					 </style>
				     <div class="button">
				     <span class="myspan"><a href="details.php?proid=<?php echo $result['productId']?>" class="details">Details</a>
				     </span>
				   
				     <span class="myspan"><form action="" method="post" >
						<input type="hidden" class="buyfield" name="productId" value="<?php echo $result['productId']?>"/>
						<input type="submit" class="buysubmit"  name="wlist" value="Save to List"/>
					</form>	
				     </span>
				     </div>
				     
				    
				</div>
				<?php } };?>
				
			</div>
		<div class="content_bottom">
    		<div class="heading">
    		<h3>Samsung</h3>
    		</div>
    		<div class="clear"></div>
    	</div>
			    <div class="section group">
	      <?php
	      	$getSamsungpd = $pd->getSamsungProduct();
	      	if ($getSamsungpd) {
	      		while ($result = $getSamsungpd->fetch_assoc()) {
	      			
	      ?>
	     
				<div class="grid_1_of_4 images_1_of_4">
					 <a href="details.php?proid=<?php echo $result['productId']?>"><img src="admin/<?php echo $result['image']?>" alt="" /></a>
					 <h2><?php echo $result['productName']?> </h2>
					 <p>
					 <?php echo $fm->textShorten($result['body'],60);?>
					 </p>
					 <p><span class="price">$<?php echo $result['price']?></span></p>
					 <style>
					 	.myspan{ width: 100px; float: left; }
					 	
					 </style>
				     <div class="button">
				     <span class="myspan"><a href="details.php?proid=<?php echo $result['productId']?>" class="details">Details</a>
				     </span>
				   
				     <span class="myspan"><form action="" method="post" >
						<input type="hidden" class="buyfield" name="productId" value="<?php echo $result['productId']?>"/>
						<input type="submit" class="buysubmit"  name="wlist" value="Save to List"/>
					</form>	
				     </span>
				     </div>
				     
				    
				</div>
				<?php } };?>
				
			</div>
	<div class="content_bottom">
    		<div class="heading">
    		<h3>Canon</h3>
    		</div>
    		<div class="clear"></div>
    	</div>
				    <div class="section group">
	      <?php
	      	$getCanonpd = $pd->getCanonProduct();
	      	if ($getCanonpd) {
	      		while ($result = $getCanonpd->fetch_assoc()) {
	      			
	      ?>
	     
				<div class="grid_1_of_4 images_1_of_4">
					 <a href="details.php?proid=<?php echo $result['productId']?>"><img src="admin/<?php echo $result['image']?>" alt="" /></a>
					 <h2><?php echo $result['productName']?> </h2>
					 <p>
					 <?php echo $fm->textShorten($result['body'],60);?>
					 </p>
					 <p><span class="price">$<?php echo $result['price']?></span></p>
					 <style>
					 	.myspan{ width: 100px; float: left; }
					 	
					 </style>
				     <div class="button">
				     <span class="myspan"><a href="details.php?proid=<?php echo $result['productId']?>" class="details">Details</a>
				     </span>
				   
				     <span class="myspan"><form action="" method="post" >
						<input type="hidden" class="buyfield" name="productId" value="<?php echo $result['productId']?>"/>
						<input type="submit" class="buysubmit"  name="wlist" value="Save to List"/>
					</form>	
				     </span>
				     </div>
				     
				    
				</div>
				<?php } };?>
				
			</div>
    </div>
 </div>

 <?php include 'inc/footer.php';?>	
