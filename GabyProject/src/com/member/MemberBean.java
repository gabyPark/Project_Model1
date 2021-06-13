package com.member;

// import java.lang.*;  // 기본패키지 (생략가능)

// DTO (Data Transfer Object)
// VO (Value Object)

public class MemberBean {

	// 자바빈  객체 : 데이터를 저장하는 객체 (DB 테이블 정보 저장)
	// 변수명을 테이블의 컬럼명과 동일하게 설정	

	private String id;
	private String pw;
	private String pw2;
	private String name;
	private String email;
	private String address1;
	private String address2;
	private String address3;
	private String address4;
	private String address5;
	
	
	private String tel;
	private String mobile;
	private String trait;
	


	// 기본 생성자
	public MemberBean() {
		
	}

	
	
	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getAddress4() {
		return address4;
	}

	public void setAddress4(String address4) {
		this.address4 = address4;
	}
	
	public String getAddress5() {
		return address5;
	}

	public void setAddress5(String address5) {
		this.address5 = address5;
	}




	// alt + shift + s + r
	// 정보를 설정하고 그 값을 불러오는 set, get 메소드 불러오기

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPw() {
		return pw;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPw2() {
		return pw2;
	}
	
	public void setPw2(String pw2) {
		this.pw2 = pw2;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
/*	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
*/	
	public String getTel() {
		return tel;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getMobile() {
		return mobile;
	}
	
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getTrait() {
		return trait;
	}

	public void setTrait(String trait) {
		this.trait = trait;
	}



	
	// alt + shift + s + s
	// toString() 메소드 가져오기
	// 해당 테이블 안에 있는 모든 멤버변수들을 가져오기 위해 필요한 것!
	// 뭐가 들어있는지 체크하기 위함

	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", pw=" + pw + ", pw2=" + pw2 + ", name=" + name + ", email=" + email
				+ ", address1=" + address1 + ", address2=" + address2 + ", address3=" + address3 + ", address4="
				+ address4 + ", address5=" + address5 + ", tel=" + tel + ", mobile=" + mobile + ", trait=" + trait
				+ "]";
	}

	


}
