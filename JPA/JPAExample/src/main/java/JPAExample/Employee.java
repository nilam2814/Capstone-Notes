package JPAExample;

import java.util.Date;

//import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "EMPLOYEE")
public class Employee {
	@Id
	@Column(name = "EMPID")
	private int empId;

	@Column(name = "Name")
	private String Name;

	@Column(name = "SALARY")
	private int salary;

	@Column(name = "ADDRESS")
	private String address;

	@Column(name = "JOINING_DATE")
	private Date joiningdate;

	public Employee() {
		// Default constructor
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getName() {
		return Name;
	}

	public void setName(String Name) {
		this.Name = Name;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(Date joiningdate) {
		this.joiningdate = joiningdate;
	}

	// Constructor with all fields
	public Employee(int empId, String Name, int salary, String address, Date joiningdate) {
		this.empId = empId;
		this.Name = Name;
		this.salary = salary;
		this.address = address;
		this.joiningdate = joiningdate;
	}
}
