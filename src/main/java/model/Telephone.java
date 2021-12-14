package model;

import java.io.Serializable;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@SuppressWarnings("serial")
@Entity
public class Telephone implements Serializable {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private int ddd;
	private String number, type;

	public Telephone() {

	}

	public Telephone(int ddd, String number, String type) {
		super();

		this.ddd = ddd;
		this.number = number;
		this.type = type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDdd() {
		return ddd;
	}

	public void setDdd(int ddd) {
		this.ddd = ddd;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	// Valida o DDD com regex
	public boolean validateDdd(String ddd) {
		return ddd.matches("([0-9]{2})");
	}

	// Valida o número de telefone com regex
	public boolean validateNumber(String number, boolean type) {
		if (type)
			return number.matches("([0-9]{9})");
		else
			return number.matches("([0-9]{8})");
	}

	// Valida o tipo de telefone {Celular ou Residencial}
	public boolean validateType(String type) {
		if (type != null) {
			return true;
		}
		return false;
	}

}
