package com.portfoli.domain;

import java.io.Serializable;
import java.sql.Date;

public class Faq extends Board implements Serializable {
  private static final long serialVersionUID = 1L;
  private int readable;
  private String answerContent;
  private Date answerDate;
  QnaCategory category;

  public int getReadable() {
    return readable;
  }
  public Faq setReadable(int readable) {
    this.readable = readable;
    return this;
  }
  public String getAnswerContent() {
    return answerContent;
  }
  public Faq setAnswerContent(String answerContent) {
    this.answerContent = answerContent;
    return this;
  }
  public Date getAnswerDate() {
    return answerDate;
  }
  public Faq setAnswerDate(Date answerDate) {
    this.answerDate = answerDate;
    return this;
  }
  public QnaCategory getCategory() {
    return category;
  }
  public Faq setCategory(QnaCategory category) {
    this.category = category;
    return this;
  }
  
  @Override
  public int hashCode() {
    final int prime = 31;
    int result = super.hashCode();
    result = prime * result + ((answerContent == null) ? 0 : answerContent.hashCode());
    result = prime * result + ((answerDate == null) ? 0 : answerDate.hashCode());
    result = prime * result + ((category == null) ? 0 : category.hashCode());
    result = prime * result + readable;
    return result;
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (!super.equals(obj))
      return false;
    if (getClass() != obj.getClass())
      return false;
    Faq other = (Faq) obj;
    if (answerContent == null) {
      if (other.answerContent != null)
        return false;
    } else if (!answerContent.equals(other.answerContent))
      return false;
    if (answerDate == null) {
      if (other.answerDate != null)
        return false;
    } else if (!answerDate.equals(other.answerDate))
      return false;
    if (category == null) {
      if (other.category != null)
        return false;
    } else if (!category.equals(other.category))
      return false;
    if (readable != other.readable)
      return false;
    return true;
  }

  @Override
  public String toString() {
    return "Faq [readable=" + readable + ", answerContent=" + answerContent + ", answerDate="
          + answerDate + ", category=" + category + "]" + super.toString();
  }


}
