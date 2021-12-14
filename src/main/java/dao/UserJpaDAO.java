package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import model.User;

public class UserJpaDAO {
	private static UserJpaDAO instance;
	protected EntityManager entityManager;

	public static UserJpaDAO getInstance() {
		if (instance == null) {
			instance = new UserJpaDAO();
		}

		return instance;
	}

	private UserJpaDAO() {
		entityManager = getEntityManager();
	}

	private EntityManager getEntityManager() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("Default");
		if (entityManager == null) {
			entityManager = factory.createEntityManager();
		}

		return entityManager;
	}

	public User getById(final int id) {
		return entityManager.find(User.class, id);

	}

	// Retorna o usuário pelo Email
	public User getByEmail(final String email) {
		Query query = this.entityManager
				.createQuery("SELECT u FROM User u WHERE u.email = :email");

		query.setParameter("email", email);

		User user;

		try {
			user = (User) query.getSingleResult();
			
		} catch (NoResultException e) {
			user = null;
		}
		
		return user;
	}
	
	// Verifica o Email e Senha para logar
	public User getLogin(final String email, final String password) {
		Query query = this.entityManager
				.createQuery("SELECT u FROM User u WHERE u.email = :email AND u.password = :password");

		query.setParameter("email", email);
		query.setParameter("password", password);

		User user;

		try {
			user = (User) query.getSingleResult();
			
		} catch (NoResultException e) {
			user = null;
		}
		
		return user;
	}

	// Utiliza o LIKE para buscar os usuários pelo termo informado
	public List<User> getByName(final String name) {
		Query query = this.entityManager
				.createQuery("SELECT u FROM User u WHERE u.name LIKE '%" + name + "%'");

		List<User> user;

		try {
			user = query.getResultList();
			
		} catch (NoResultException e) {
			user = null;
		}
		
		return user;
		
	/*	
		
		CriteriaBuilder qb = entityManager.getCriteriaBuilder();
		CriteriaQuery<User> cq = qb.createQuery(User.class);
		Root<User> user = cq.from(User.class);

		cq.where(qb.like(user.get("name"), "%" + name + "%"));

		return entityManager.createQuery(cq).getResultList();*/
	}

	// Busca todos os usuários
	@SuppressWarnings("unchecked")
	public List<User> findAll() {
		return entityManager.createQuery("FROM " + User.class.getName()).getResultList();
	}

	public void persist(User user) {
		try {
			entityManager.getTransaction().begin();
			entityManager.persist(user);
			entityManager.getTransaction().commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			entityManager.getTransaction().rollback();
		}
	}

	// Recebe o id do usuário e atualiza com os novos dados
	public void updateById(final int id, User newUser) {
		User user = entityManager.find(User.class, id);
		user.setName(newUser.getName());
		user.setEmail(newUser.getEmail());
		user.setPassword(newUser.getPassword());
		user.setTel(newUser.getTel());
		merge(user);
	}

	public void merge(User user) {
		try {
			entityManager.getTransaction().begin();
			entityManager.merge(user);
			entityManager.getTransaction().commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			entityManager.getTransaction().rollback();
		}
	}

	public void remove(User user) {
		try {
			entityManager.getTransaction().begin();
			user = entityManager.find(User.class, user.getId());
			entityManager.remove(user);
			entityManager.getTransaction().commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			entityManager.getTransaction().rollback();
		}
	}

	public void removeById(final int id) {
		try {
			User user = getById(id);
			remove(user);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
