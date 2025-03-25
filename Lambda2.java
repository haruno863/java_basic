package lesson11;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.stream.IntStream;

public class Lambda2 {
	private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("HH:mm:ss.SSS");

	public static void main(String[] args) {
		IntStream.range(1, 10000).forEach(i -> System.out.println(LocalDateTime.now().format(FORMATTER) + " " + i));
	}
}
