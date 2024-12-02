package persistencia;

import java.io.Serializable;
import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import logica.Administrador;
import persistencia.exceptions.NonexistentEntityException;

public class AdministradorJpaController implements Serializable {
   private EntityManagerFactory emf = null;

   public AdministradorJpaController(EntityManagerFactory emf) {
      this.emf = emf;
   }

   public AdministradorJpaController() {
      this.emf = Persistence.createEntityManagerFactory("REHOBOT");
   }

   public EntityManager getEntityManager() {
      return this.emf.createEntityManager();
   }

   public void create(Administrador administrador) {
      EntityManager em = null;

      try {
         em = this.getEntityManager();
         em.getTransaction().begin();
         em.persist(administrador);
         em.getTransaction().commit();
      } finally {
         if (em != null) {
            em.close();
         }

      }

   }

   public void edit(Administrador administrador) throws NonexistentEntityException, Exception {
      EntityManager em = null;

      try {
         em = this.getEntityManager();
         em.getTransaction().begin();
         administrador = (Administrador)em.merge(administrador);
         em.getTransaction().commit();
      } catch (Exception var7) {
         if (this.findAdministrador(administrador.getId_Persona()) == null) {
            throw new NonexistentEntityException("El administrador con id " + administrador.getId_Persona() + " no existe.");
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

         Administrador administrador;
         try {
            administrador = (Administrador)em.getReference(Administrador.class, id);
            administrador.getId_Persona();
         } catch (Exception var8) {
            throw new NonexistentEntityException("El administrador con id " + id + " no existe.");
         }

         em.remove(administrador);
         em.getTransaction().commit();
      } finally {
         if (em != null) {
            em.close();
         }

      }

   }

   public List<Administrador> findAdministradorEntities() {
      return this.findAdministradorEntities(true, -1, -1);
   }

   public List<Administrador> findAdministradorEntities(int maxResults, int firstResult) {
      return this.findAdministradorEntities(false, maxResults, firstResult);
   }

   private List<Administrador> findAdministradorEntities(boolean all, int maxResults, int firstResult) {
      EntityManager em = this.getEntityManager();

      List var8;
      try {
         CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
         cq.select(cq.from(Administrador.class));
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

   public Administrador findAdministrador(int id) {
      EntityManager em = this.getEntityManager();

      Administrador var4;
      try {
         var4 = (Administrador)em.find(Administrador.class, id);
      } finally {
         em.close();
      }

      return var4;
   }

   public int getAdministradorCount() {
      EntityManager em = this.getEntityManager();

      int var6;
      try {
         CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
         Root<Administrador> rt = cq.from(Administrador.class);
         cq.select(em.getCriteriaBuilder().count(rt));
         Query q = em.createQuery(cq);
         var6 = ((Long)q.getSingleResult()).intValue();
      } finally {
         em.close();
      }

      return var6;
   }
}
