package JPAExample;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class StudentManagement {
	private static EntityManager em;
	
public static void main(String[] args) {
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("StudentPU");
    em=emf.createEntityManager();
    
    //CREATE
//    em.getTransaction().begin();
//    Student student=new Student(101,"Eshan","Madake",80);
//    em.persist(student);
//    em.getTransaction().commit();
    
    
    //SEARCH
//    Student s=em.find(Student.class, 101);
//    if(s!=null) {
//    	System.out.println("Student first name="+s.getFirstName());
//    	System.out.println("Student ID="+s.getId());
//    	System.out.println("Student Last name="+s.getLastName());
//    	System.out.println("student marks="+s.getMarks());
//    	
//    }else {
//    	System.out.println("Record is not present in database.");
//    }
    
    
    
    //UPDATE
    
//    em.getTransaction().begin();
//    Student s=em.find(Student.class,101);
//    System.out.println("Student first name="+s.getFirstName());
//	System.out.println("Student ID="+s.getId());
//	System.out.println("Student Last name="+s.getLastName());
//	System.out.println("student marks="+s.getMarks());
//	
//	s.setMarks(100);
//	
//	System.out.println("\n\nAfter Updation...");
//	System.out.println("Student first name="+s.getFirstName());
//	System.out.println("Student ID="+s.getId());
//	System.out.println("Student Last name="+s.getLastName());
//	System.out.println("student marks="+s.getMarks());
//	
//	em.getTransaction().commit();
	
    
    
    //DELETE
    em.getTransaction().begin();
    Student s=em.find(Student.class, 101);
    em.remove(s);
    em.getTransaction().commit();
    System.out.println(em.getTransaction().isActive());
    
    //close
    em.close();
    emf.close();
}
}
