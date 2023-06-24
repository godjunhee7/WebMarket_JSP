package com.market;

import java.util.ArrayList;

public class ProductRepository {
	
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
	private static ProductRepository instance = new ProductRepository();
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}

	public ProductRepository() {
		Product phone = new Product("P0001", "iPhome 14 Pro", 1500000);
		phone.setDescription("15.5cm ���� ȭ�� OLED ���÷���, 2556*1179 �ȼ� �ػ�");
		phone.setCategory("Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("����ǰ");
		phone.setFilename("P0001.png");
		
		Product notebook = new Product("P0002", "LG PC �׷�", 1200000);
		notebook.setDescription("13.3��ġ, IPS LED ���ø���, ���� �ھ� ���μ���");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("���ǰ");
		notebook.setFilename("P0002.png");
		
		Product tablet = new Product("P0003", "Galaxy Tab S8", 400000);
		tablet.setDescription("2560*1600 �ȼ� �ػ�");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("�߰�ǰ");
		tablet.setFilename("P0003.png");
		

		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	} 	
	
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}	
	
	public Product getProductById(String productId) {
		Product result = null;
		
		for(int i=0; i<listOfProducts.size(); i++) {
			Product p = listOfProducts.get(i);
			if (p != null &&
					p.getProductId() != null &&
						p.getProductId().equals(productId)) {
				
				result = p;
				break;
			}
		}
		return result;
	}

}
