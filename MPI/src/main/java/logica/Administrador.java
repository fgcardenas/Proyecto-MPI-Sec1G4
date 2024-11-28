
package logica;

public class Administrador {
    private String dni;
    private String name;
    private String lastName;
    private String phone;
    private String email;
    private String address;
    private String userName;
    private String password;

    public Administrador(String dni, String name, String lastName, String phone, String email, String address, String userName, String password) {
        this.dni = dni;
        this.name = name;
        this.lastName = lastName;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.userName = userName;
        this.password = password;
    }

    // Getters y Setters
    public String getDni() { return dni; }
    public String getNombre() { return name; }
    public String getApellido() { return lastName; }
    public String getTelefono() { return phone; }
    public String getEmail() { return email; }
    public String getAddress() { return address; }
    public String getUserName() { return userName; }
    public String getPassword() { return password; }
}

