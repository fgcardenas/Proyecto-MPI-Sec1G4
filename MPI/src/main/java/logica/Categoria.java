package logica;

import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table (name="categorias")
public class Categoria {
    @Id
    @GeneratedValue(
        strategy = GenerationType.IDENTITY
    )
    private int id_Categoria;
    
    private String nombre_Categoría;
    private String descripcion_Categoria;
    
    private List<Articulo> listArticle = new ArrayList();
    
    public Categoria(){
    }
    public Categoria(String nombre_Categoría, String descripcion_Categoria, int id_categoria){
        this.nombre_Categoría = nombre_Categoría;
        this.descripcion_Categoria = descripcion_Categoria;
        this.id_Categoria = id_categoria;
    }
    
    public String getNombreCategoría(){
        return nombre_Categoría;
    }
    
    public void addArticleToCategory(Articulo article){
        listArticle.add(article);
    }
    public void deleteArticleToCategory(Articulo article){
        for(int i=0; i<listArticle.size(); i++){
            if(listArticle.get(i).equals(article)){
                listArticle.remove(i);
            }
        }
    }
    
    public String getDescripcionCategoria(){
        return descripcion_Categoria;
    }
    
    public void setDescripcionCategoria(String descrip){
        this.descripcion_Categoria = descrip;
    }
    
    public int getId_Categoria(){
        return id_Categoria;
    }
}
