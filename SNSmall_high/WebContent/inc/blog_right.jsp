<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            
<script type="text/javascript">
function blogSearch(){
	search = document.getElementById('BlogSearch').value;
	location.href = './OurBlogSearchAction.bl?search='+search;
}
</script>
		<br>
            <div class="col-md-3">
         
        <!-- Blog Home posting Well --> 
        <div class="well" style="padding: 0px; text-align: center; background-color: skyblue;">
       				<a href="./OurBlog.bl"> 
	       				<button class="blogHome-btn">
	       					<i class="fa fa-home" aria-hidden="true"></i>
	       					<span class="blogHome-letter">Blog</span>
	       				</button> 
       				</a>
       			</div>    

        <!-- Blog produce Well -->
				 <div class="well">
					 <div class="blog_produce" style="margin:auto;">
				 		
						<div class="blog_produce_img">
						
						</div>

						
						<div class="blog_produce_content_box">
						
						www' shopping.<br>
						<hr style="margin: 5px;">
						 #sns celeb #trend<br>
						 #social network shopping<br>
						 #fishion #beauty<br>
						 #baby #daily #gym<br>
						 </div>
				
				 	</div>
				 </div>
				 
			<!-- Blog posting btn Well --> 
			<% 
			String id = (String)session.getAttribute("id");
			
			if(id!=null){
				if(id.equals("admin")){%>     
	       			<div class="well" style="padding: 0px; text-align: center; background-color: skyblue;">
	       				<a href="./OurBlogPosting.bl"> 
		       				<button class="posting_btn">
		       					<span class="blogHome-letter">posting</span>
		       				</button> 
	       				</a>
	       			</div>
	       			<%}
       			}%>
				
                <!-- Blog Search Well -->
                <div class="well">
                    <h4>Blog Search</h4>
                    <div class="input-group">
                        <input type="text" id="BlogSearch" class="form-control">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button" onclick="blogSearch()" style="padding: 9px 15px 9px 15px;">
                                <span class="glyphicon glyphicon-search"></span>
                        </button>
                        </span>
                    </div>
                    <!-- /.input-group -->
                </div>

                <!-- Blog Categories Well -->
                <div class="well">
                    <h4>Blog Categories</h4>
                    <div class="row">
                        <div class="col-lg-8">
                            <ul class="list-unstyled">
                                <li>
	                                <a href="./OurBlogCategory.bl?category=notice">　
		                                <i class="fa fa-file-text-o" aria-hidden="true"></i>　notice
	                                </a>
                                </li>
                                
                                <li>
	                                <a href="./OurBlogCategory.bl?category=contribution">　
	                                	<i class="fa fa-globe" aria-hidden="true"></i>　contribution
	                                </a>
                                </li>
                                
                                <li>
	                                <a href="./OurBlogCategory.bl?category=Event">　
	                                	<i class="fa fa-gift" aria-hidden="true"></i>　Event
	                                </a>
                                </li>
                                <li>
                                	<a href="./OurBlogCategory.bl?category=service">　
                                		<i class="fa fa-star" aria-hidden="true"></i>　service
                                	</a>
                                </li>
                                <li>
	                                <a href="./OurBlogCategory.bl?category=advertising">　
	                                	<i class="fa fa-lightbulb-o" aria-hidden="true"></i>　advertising
	                                </a>
                                </li>
                            	
                            </ul>
                        </div>
                       
                        <div class="col-lg-4"></div>
                    </div>
                    <!-- /.row -->
                </div>
   
            </div>