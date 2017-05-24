<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            
<script type="text/javascript">
function blogSearch(){
	search = document.getElementById('BlogSearch').value;
	location.href = './OurBlogSearchAction.bl?search='+search;
}
</script>
            <div class="col-md-3">
             <!-- Blog produce Well -->
				 <div class="well">
					 <div class="blog_produce">
				 		<img alt="" src="./images/blog/blog_img.jpg" style="width: 200px; height: 200px">
						<div class="blog_produce_img">
						
						</div>
						
						<div class="blog_produce_content">
						
						 www' shopping.<br>
						 #sns celeb #trend<br>
						 #social network shopping<br>
						 #fishion #beauty<br>
						 #baby #daily #gym<br>
						 
						</div>
				 	</div>
				 </div>
				
                <!-- Blog Search Well -->
                <div class="well">
                    <h4>Blog Search</h4>
                    <div class="input-group">
                        <input type="text" id="BlogSearch" class="form-control">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button" onclick="blogSearch()">
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
                        <div class="col-lg-6">
                            <ul class="list-unstyled">
                                <li><a href="./OurBlogCategory.bl?category=notice">　notice</a>
                                </li>
                                <li><a href="./OurBlogCategory.bl?category=contribution">　contribution</a>
                                </li>
                                <li><a href="./OurBlogCategory.bl?category=Event">　Event</a>
                                </li>
                                <li><a href="./OurBlogCategory.bl?category=service">　service</a>
                                </li>
                                 <li><a href="./OurBlogCategory.bl?category=advertising">　advertising</a>
                                </li>
                            </ul>
                        </div>
                        <!-- /.col-lg-6 -->
                        <div class="col-lg-6">
  
                        </div>
                        <!-- /.col-lg-6 -->
                    </div>
                    <!-- /.row -->
                </div>

                <!-- Side Widget Well -->
                <div class="well">
                    <h4>Side Widget Well</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, perspiciatis adipisci accusamus laudantium odit aliquam repellat tempore quos aspernatur vero.</p>
                </div>

            </div>