/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Vova
 */
public class CommentModel extends BaseModel{
  
  private AuthModel createdBy;
  private String content;

  public AuthModel getCreatedBy() {
    return createdBy;
  }

  public void setCreatedBy(AuthModel createdBy) {
    this.createdBy = createdBy;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }
  
  
  
}
