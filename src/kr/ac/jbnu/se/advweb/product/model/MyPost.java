package kr.ac.jbnu.se.advweb.product.model;

public class MyPost extends Post{

   private String postScrapperId;
   
   public MyPost(){

   }
   
   public MyPost(String post_id, String post_scrapper_id, String post_nickname, String post_subject, String post_content,//
          int post_visible) {

         this.postId = post_id;
         this.postScrapperId = post_scrapper_id;
         this.postNickname = post_nickname;
         this.postSubject = post_subject;
         this.postContent = post_content;
         this.postVisible = post_visible;
         
      }
   
   public void setpostScrapperId(String post_scrapper_id) {
      this.postScrapperId = post_scrapper_id;
   }
   
   public String getpostScrapperId() {
      return this.postScrapperId;
   }
   
}