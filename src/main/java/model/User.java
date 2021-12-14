package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@SuppressWarnings("serial")
@Entity
public class User implements Serializable{
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Column(unique=true)
	private String email;
	private String name, password;
	@OneToMany (cascade = CascadeType.ALL)
	private List<Telephone> tel = new ArrayList<Telephone>();
	
	public User() {

	}

	public User(String name, String email, String password, List<Telephone> tel) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.tel = tel;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public List<Telephone> getTel() {
		return tel;
	}


	public void setTel(List<Telephone> tel) {
		this.tel = tel;
	}

	// Valida o nome informado com regex
	public static boolean validateName(String name) {
		if (!(name == null || name.isEmpty())) {
			return name.matches("^[[ ]|\\p{L}*]+$");
		}
		return false;
	}
	
	// Valida o email informado com regex
	public static boolean validateEmail(String email) {
		if (!(email == null || email.isEmpty())) {
			return email.matches("^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$");
		}
		return false;
	}
	
	// Valida a senha
	public static boolean validatePassword(String password) {
		
		if (!(password == null || password.isEmpty())) {
			return password.matches(".{6,}");
		}
		return false;
	}
}
