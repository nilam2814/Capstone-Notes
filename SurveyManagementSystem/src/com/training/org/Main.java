package com.training.org;

import java.util.List;
import java.util.Scanner;

public class Main {
public static void main(String[] args) {
	IFeedbackService feedback = new ServiceImpl();
	 Scanner scanner = new Scanner(System.in);

     while (true) {
         System.out.println("Choose an option:");
         System.out.println("1. Add Feedback");
         System.out.println("2. Find feedback by id");
         System.out.println("3. Find feedbacks by author name");
         System.out.println("4. Exit");

         int choice = scanner.nextInt();
         scanner.nextLine(); 
         
         switch (choice) {
         case 1:
        	 System.out.print("description :  ");
             String description = scanner.nextLine();
        	 
             System.out.print("author : ");
             String author = scanner.nextLine();

             Feedback addFeedback = feedback.add(author,description);
             System.out.println("Feedcack registered with ID: " + addFeedback.getId());
             break;

         case 2:
             System.out.print("Enter Feedback ID to search: ");
             long searchId = scanner.nextLong();

             Feedback foundFeedback = feedback.findById(searchId);
             if (foundFeedback != null) {
                 System.out.println("Feedback Details:");
                 System.out.println(foundFeedback);
             } else {
                 System.out.println("Feedback not found.");
             }
             break;

         case 3:
             System.out.print("Enter authorName: ");
             String searchText = scanner.nextLine();

             List<Feedback> matchingFeedback = feedback.findFeedbacksByAuthorOrderById(searchText);
             if (matchingFeedback.isEmpty()) {
                 System.out.println("No Feedback found matching");
             } else {
                 System.out.println("Feedback matching , ordered by ID:");
                 for (Feedback employee : matchingFeedback) {
                     System.out.println(employee);
                 }
             }
             break;

         case 4:
             System.out.println("Exiting the program.");
             scanner.close();
             System.exit(0);

         default:
             System.out.println("Invalid choice. Please enter a valid option.");

}
}}}
