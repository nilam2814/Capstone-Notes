package com.training.org;

public class Feedback {

	    private long id;
	    public long getId() {
			return id;
		}
		public void setId(long id) {
			this.id = id;
		}
		public String getAuthor() {
			return author;
		}
		public void setAuthor(String author) {
			this.author = author;
		}
		public String getDescription() {
			return description;
		}

		private String description;
	    private String author;
		public Feedback(long id, String description, String author) {
			super();
			this.id = id;
			this.description = description;
			this.author = author;
		}
		@Override
		public String toString() {
			return "Feedback [id=" + id + ", description=" + description + ", author=" + author + "]";
		}
	    
		 private boolean isValidDescription(String name) {
		        return name.length() >= 5 && name.length() <= 50;
		    }
		 
		 private boolean isValidAuthorName(String name) {
		        return name.length() >= 2 && name.length() <= 20;
		    }
		 
		  public void setDescription(String description) {
		        if (isValidDescription(description)) {
		            this.description = description;
		        } else {
		            this.description = "Invalid";
		        }
		    }
		  
		  public void setAuthorName(String author) {
		        if (isValidAuthorName(author)) {
		            this.author = author;
		        } else {
		            this.author = "Invalid";
		        }
		    }
}
