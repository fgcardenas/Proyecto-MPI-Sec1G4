package persistencia;

import java.io.Serializable;
import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import logica.Persona;
import persistencia.exceptions.NonexistentEntityException;

public class PersonaJpaController implements Serializable {
   private EntityManagerFactory emf = null;

   public PersonaJpaController(EntityManagerFactory emf) {
      this.emf = emf;
   }

   public PersonaJpaController() {
      this.emf = Persistence.createEntityManagerFactory("rehobotdb");
   }

   public EntityManager getEntityManager() {
      return this.emf.createEntityManager();
   }

   public void create(Persona persona) {
      EntityManager em = null;

      try {
         em = this.getEntityManager();
         em.getTransaction().begin();
         em.persist(persona);
         em.getTransaction().commit();
      } finally {
         if (em != null) {
            em.close();
         }

      }

   }

   public void edit(Persona persona) throws NonexistentEntityException, Exception {
      EntityManager em = null;

      try {
         em = this.getEntityManager();
         em.getTransaction().begin();
         persona = (Persona)em.merge(persona);
         em.getTransaction().commit();
      } catch (Exception var7) {
         if (this.findPersona(persona.getId_Persona()) == null) {
            throw new NonexistentEntityException("La persona con id " + persona.getId_Persona() + " no existe.");
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

         Persona persona;
         try {
            persona = (Persona)em.getReference(Persona.class, id);
            persona.getId_Persona();
         } catch (Exception var8) {
            throw new NonexistentEntityException("La persona con id " + id + " no existe.");
         }

         em.remove(persona);
         em.getTransaction().commit();
      } finally {
         if (em != null) {
            em.close();
         }

      }

   }

   public List<Persona> findPersonaEntities() {
      return this.findPersonaEntities(true, -1, -1);
   }

   public List<Persona> findPersonaEntities(int maxResults, int firstResult) {
      return this.findPersonaEntities(false, maxResults, firstResult);
   }

   private List<Persona> findPersonaEntities(boolean all, int maxResults, int firstResult) {
      EntityManager em = this.getEntityManager();

      List var8;
      try {
         CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
         cq.select(cq.from(Persona.class));
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

   public Persona findPersona(int id) {
      EntityManager em = this.getEntityManager();

      Persona var4;
      try {
         var4 = (Persona)em.find(Persona.class, id);
      } finally {
         em.close();
      }

      return var4;
   }

   public int getPersonaCount() {
      EntityManager em = this.getEntityManager();

      int var6;
      try {
         CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
         Root<Persona> rt = cq.from(Persona.class);
         cq.select(em.getCriteriaBuilder().count(rt));
         Query q = em.createQuery(cq);
         var6 = ((Long)q.getSingleResult()).intValue();
      } finally {
         em.close();
      }

      return var6;
   }
}
