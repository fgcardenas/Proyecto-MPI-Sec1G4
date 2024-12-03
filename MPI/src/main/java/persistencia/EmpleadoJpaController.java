package persistencia;

import java.io.Serializable;
import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import logica.Empleado;
import persistencia.exceptions.NonexistentEntityException;

public class EmpleadoJpaController implements Serializable {
   private EntityManagerFactory emf = null;

   public EmpleadoJpaController(EntityManagerFactory emf) {
      this.emf = emf;
   }

   public EmpleadoJpaController() {
      this.emf = Persistence.createEntityManagerFactory("rehobotdb");
   }

   public EntityManager getEntityManager() {
      return this.emf.createEntityManager();
   }

   public void create(Empleado empleado) {
      EntityManager em = null;

      try {
         em = this.getEntityManager();
         em.getTransaction().begin();
         em.persist(empleado);
         em.getTransaction().commit();
      } finally {
         if (em != null) {
            em.close();
         }

      }

   }

   public void edit(Empleado empleado) throws NonexistentEntityException, Exception {
      EntityManager em = null;

      try {
         em = this.getEntityManager();
         em.getTransaction().begin();
         empleado = (Empleado)em.merge(empleado);
         em.getTransaction().commit();
      } catch (Exception var7) {
         if (this.findEmpleado(empleado.getId_Persona()) == null) {
            throw new NonexistentEntityException("El empleado con id " + empleado.getId_Persona() + " no existe.");
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

         Empleado empleado;
         try {
            empleado = (Empleado)em.getReference(Empleado.class, id);
            empleado.getId_Persona();
         } catch (Exception var8) {
            throw new NonexistentEntityException("El empleado con id " + id + " no existe.");
         }

         em.remove(empleado);
         em.getTransaction().commit();
      } finally {
         if (em != null) {
            em.close();
         }

      }

   }

   public List<Empleado> findEmpleadoEntities() {
      return this.findEmpleadoEntities(true, -1, -1);
   }

   public List<Empleado> findEmpleadoEntities(int maxResults, int firstResult) {
      return this.findEmpleadoEntities(false, maxResults, firstResult);
   }

   private List<Empleado> findEmpleadoEntities(boolean all, int maxResults, int firstResult) {
      EntityManager em = this.getEntityManager();

      List var8;
      try {
         CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
         cq.select(cq.from(Empleado.class));
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

   public Empleado findEmpleado(int id) {
      EntityManager em = this.getEntityManager();

      Empleado var4;
      try {
         var4 = (Empleado)em.find(Empleado.class, id);
      } finally {
         em.close();
      }

      return var4;
   }

   public int getEmpleadoCount() {
      EntityManager em = this.getEntityManager();

      int var6;
      try {
         CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
         Root<Empleado> rt = cq.from(Empleado.class);
         cq.select(em.getCriteriaBuilder().count(rt));
         Query q = em.createQuery(cq);
         var6 = ((Long)q.getSingleResult()).intValue();
      } finally {
         em.close();
      }

      return var6;
   }
}
