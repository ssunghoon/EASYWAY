package org.easyway.security.domain;

import java.util.ArrayList;
import java.util.Collection;

import org.easyway.domain.member.MemberVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
public class CustomUser implements UserDetails {

	private static final long serialVersionUID = 1L;

	private MemberVO member;
	
	public CustomUser(MemberVO member) {
		this.member = member;		
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		Collection<GrantedAuthority> collect = new ArrayList<>();
		collect.add(() -> member.getMemberAuth());
		return collect;
	}

	@Override
	public String getPassword() {
		return member.getMemberPassword();
	}

	@Override
	public String getUsername() {
		return member.getMemberEmail();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
}
