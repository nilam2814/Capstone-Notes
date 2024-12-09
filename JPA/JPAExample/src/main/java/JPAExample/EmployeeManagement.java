package JPAExample;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EmployeeManagement {
	private static EntityManager em;

	public static void main(String[] args) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("StudentPU");
		em = emf.createEntityManager();

		em.getTransaction().begin();

		List<Employee> employees = new ArrayList<>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for (int i = 1; i <= 10; i++) {
			Employee employee = new Employee();
			employee.setEmpId(i);
			employee.setName("Employee" + i);
			employee.setSalary(10000 * i);
			employee.setAddress("Address" + i);
			//employee.setJoiningdate(new Date());
			try {
                // Set different joining dates for each employee
                Date joiningDate = sdf.parse("2022-12-" + i); // Change the date pattern as needed
                employee.setJoiningdate(joiningDate);
            } catch (Exception e) {
                e.printStackTrace();
            }
			employees.add(employee);
		}

		for (Employee employee : employees) {
			em.persist(employee);
		}

		em.getTransaction().commit();
		System.out.println("Records inserted successfully.");

		em.close();
		emf.close();
	}
}
