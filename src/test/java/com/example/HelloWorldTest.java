package com.example;

import org.junit.Test;
import static org.junit.Assert.*;

public class HelloWorldTest {

    @Test
    public void testGetGreeting() {
        Main main = new Main();  // Use the correct class name: "Main"
        assertEquals("Hello, World!", main.getGreeting());
    }
}
