package com.example;

public class RecorderRunner {
	public static void main(String[] args) {
		Recorder recorder = new Recorder();

		System.out.println("=================");
		System.out.println("=== set & get ===");
		System.out.println("=================");

		recorder.put("key1", "value1");
		recorder.get("key1");

		System.out.println("");
		System.out.println("=======================");
		System.out.println("=== get unknown key ===");
		System.out.println("=======================");

		try {
			recorder.get("unknown");
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		}

		System.out.println("");
		System.out.println("====================");
		System.out.println("=== set & delete ===");
		System.out.println("====================");

		recorder.put("key2", "will delete");
		recorder.delete("key2");

		System.out.println("");
		System.out.println("==========================");
		System.out.println("=== delete unknown key ===");
		System.out.println("==========================");

		try {
			recorder.get("key2");
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		}

		System.out.println("");
		System.out.println("========================");
		System.out.println("=== delete all & get ===");
		System.out.println("========================");

		recorder.delete();

		try {
			recorder.get("key1");
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		}
	}
}
