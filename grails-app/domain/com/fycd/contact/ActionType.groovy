package com.fycd.contact

public enum ActionType {

	CREATE("Create"),
	UPDATE("Update"),
	DELETE("Delete"),
	READ("Read")

	private final String value

	ActionType(String v) {
		value = v;
	}

	public String value() {
		return value;
	}
}
