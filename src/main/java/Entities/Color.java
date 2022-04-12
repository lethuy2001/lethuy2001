package Entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the colors database table.
 * 
 */
@Entity
@Table(name="colors")
@NamedQuery(name="Color.findAll", query="SELECT c FROM Color c")
public class Color implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String name;

	//bi-directional many-to-one association to Product
	@OneToMany(mappedBy="color")
	private List<Product> products;

	public Color() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Product> getProducts() {
		return this.products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public Product addProduct(Product product) {
		getProducts().add(product);
		product.setColor(this);

		return product;
	}

	public Product removeProduct(Product product) {
		getProducts().remove(product);
		product.setColor(null);

		return product;
	}

}