package persistencia;

import java.io.Serializable;
import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import logica.Cliente;
import persistencia.exceptions.NonexistentEntityException;

public class ClienteJpaController implements Serializable {
   private EntityManagerFactory emf = null;

   public ClienteJpaController(EntityManagerFactory emf) {
      this.emf = emf;
   }

   public ClienteJpaController() {
      this.emf = Persistence.createEntityManagerFactory("rehobotdb");
   }

   public EntityManager getEntityManager() {
      return this.emf.createEntityManager();
   }

   public void create(Cliente cliente) {
      EntityManager em = null;

      try {
         em = this.getEntityManager();
         em.getTransaction().begin();
         em.persist(cliente);
         em.getTransaction().commit();
      } finally {
         if (em != null) {
            em.close();
         }

      }

   }

   public void edit(Cliente cliente) throws NonexistentEntityException, Exception {
      EntityManager em = null;

      try {
         em = this.getEntityManager();
         em.getTransaction().begin();
         cliente = (Cliente)em.merge(cliente);
         em.getTransaction().commit();
      } catch (Exception var7) {
         if (this.findCliente(cliente.getId_Persona()) == null) {
            throw new NonexistentEntityException("El cliente con id " + cliente.getId_Persona() + " no existe.");
         }

         throw var7;
      } finally {
         if (em != null) {
            em.close();
         }

      }

   }

   public void destroy(int id) throws NonexistentEntityException {
      EntityManager em = null;

      try {
         em = this.getEntityManager();
         em.getTransaction().begin();

         Cliente cliente;
         try {
            cliente = (Cliente)em.getReference(Cliente.class, id);
            cliente.getId_Persona();
         } catch (Exception var8) {
            throw new NonexistentEntityException("El cliente con id " + id + " no existe.");
         }

         em.remove(cliente);
         em.getTransaction().commit();
      } finally {
         if (em != null) {
            em.close();
         }

      }

   }

   public List<Cliente> findClienteEntities() {
      return this.findClienteEntities(true, -1, -1);
   }

   public List<Cliente> findClienteEntities(int maxResults, int firstResult) {
      return this.findClienteEntities(false, maxResults, firstResult);
   }

   private List<Cliente> findClienteEntities(boolean all, int maxResults, int firstResult) {
      EntityManager em = this.getEntityManager();

      List var8;
      try {
         CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
         cq.select(cq.from(Cliente.class));
         Query q = em.createQuery(cq);
         if (!all) {
            q.setMaxResults(maxResults);
            q.setFirstResult(firstResult);
         }

         var8 = q.getResultList();
      } finally {
         em.close();
      }

      return var8;
   }

   public Cliente findCliente(int id) {
      EntityManager em = this.getEntityManager();

      Cliente var4;
      try {
         var4 = (Cliente)em.find(Cliente.class, id);
      } finally {
         em.close();
      }

      return var4;
   }

   public int getClienteCount() {
      EntityManager em = this.getEntityManager();

      int var6;
      try {
         CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
         Root<Cliente> rt = cq.from(Cliente.class);
         cq.select(em.getCriteriaBuilder().count(rt));
         Query q = em.createQuery(cq);
         var6 = ((Long)q.getSingleResult()).intValue();
      } finally {
         em.close();
      }

      return var6;
   }
}
