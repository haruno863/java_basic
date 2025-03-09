package lesson11;

public abstract class AbstractPerson {

	abstract String getGender();

	public void speak() {
		System.out.println("I'm a " + getGender());
	}
}
