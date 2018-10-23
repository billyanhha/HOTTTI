/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Vova
 */
public class ImageModel extends BaseModel{
  
  private Date createdAt;
  private String title;
  private AuthModel createdBy;

  public Date getCreatedAt() {
    return createdAt;
  }

  public void setCreatedAt(Date createdAt) {
    this.createdAt = createdAt;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public AuthModel getCreatedBy() {
    return createdBy;
  }

  public void setCreatedBy(AuthModel createdBy) {
    this.createdBy = createdBy;
  }

  
  
  
}
