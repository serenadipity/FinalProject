import java.util.*;
import java.io.*;

public class Player {

    private String sport;
    private int age;
    private boolean gender;

    public Player(String s, int a, boolean g) {
	     sport = s;
	     age = a;
	     gender = g;
    }

    public String getSport() {
      return sport;
    }

    public int getAge() {
      return age;
    }

    public boolean getGender() {
      return gender;
    }


}
