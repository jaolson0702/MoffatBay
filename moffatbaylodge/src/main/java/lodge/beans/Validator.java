/* Team Delta
 * Members: Jared Olson, Bryce Kellas, Charlene Centeno, Anh Vo
 * Authors: Bryce Kellas
 * 
 */
package lodge.beans;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.lang3.StringUtils;

public class Validator {

    private ArrayList<String> errorMessages;

    // Registration Messages
    private static final String EMAIL_EMPTY = "Email is required";
    private static final String EMAIL_INVALID = "Email is invalid";
    private static final String FNAME_EMPTY = "First name is required";
    private static final String FNAME_INVALID = "First name is invalid";
    private static final String LNAME_EMPTY = "Last name is required";
    private static final String LNAME_INVALID = "Last name is invalid";
    private static final String PHONE_EMPTY = "Phone number is required";
    private static final String PHONE_INVALID = "Phone number must match 123-456-7890 pattern";
    private static final String PASSWORD_EMPTY = "Password is required";
    private static final String PASSWORD_LENGTH = "Password must be at least 8 characters";
    private static final String PASSWORD_CASE = "Password must contain at least 1 upper case and at least 1 lower case letter";
    
    // Reservation ID messages
    private static final String RES_ID_EMPTY = "Reservation ID is required";
    private static final String RES_ID_INVALID = "Reservation ID must be numeric";

    // Date messages
    private static final String DATES_EMPTY = "Check-in and check-out dates are required";
    private static final String DATES_INVALID = "Check-out date must be later than the check-in date";
    //private static final String CHECKIN_EMPTY = "Check-in date is required";
    //private static final String CHECKIN_INVALID = "Check-out date must be later than the check-in date";
    //private static final String CHECKOUT_EMPTY = "Check-out date is required";

    // Search messages
    private static final String SEARCHBY_EMPTY = "Search by selection is required";
    

    // Contructors
    public Validator() {
        errorMessages = new ArrayList<String>();
    }

    // "Getter" returns copy of errorMessages
    public ArrayList<String> getErrorMessages() {
        errorMessages.sort(Comparator.naturalOrder());
        ArrayList<String> temp = new ArrayList<String>();
        for (String s : errorMessages) {
            temp.add(s);
        }
        return temp;
    }
    
    // Email Validation
    public boolean IsEmailValid(String email) {
        if (email.isEmpty() || email == null) {
            errorMessages.add(EMAIL_EMPTY);
            return false;
        } else if (!email.matches("^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@" + 
                                "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$")) {
            errorMessages.add(EMAIL_INVALID);
            return false;
        } else {
            return true;
        }
    }
    
    // Name validations
    public boolean isFirstNameValid(String fName) {
        if (fName.isEmpty() || fName == null) {
            errorMessages.add(FNAME_EMPTY);
            return false;
        } else if (!fName.matches("^[a-zA-Z]*$")) {
            errorMessages.add(FNAME_INVALID);
            return false;
        } else {
            return true;
        }
    }
    public boolean isLastNameValid(String lName) {
        if (lName.isEmpty() || lName == null) {
            errorMessages.add(LNAME_EMPTY);
            return false;
        } else if (!lName.matches("^[a-zA-Z]*$")) {
            errorMessages.add(LNAME_INVALID);
            return false;
        } else {
            return true;
        }
    }

    // Phone validation
    public boolean isPhoneValid(String phone) {
        Pattern pattern = Pattern.compile("^(\\d{3}\\-){2}\\d{4}$");
        Matcher matcher = pattern.matcher(phone);
        
        if (phone.isEmpty() || phone == null) {
            errorMessages.add(PHONE_EMPTY);
            return false;
        }
        else if (!matcher.matches()){
            errorMessages.add(PHONE_INVALID);
            return false;
        } else {
            return true;
        }
    }

    // Password validations
    public boolean isPasswordValid(String password) {
        if (password.isEmpty() || password == null) {
            errorMessages.add(PASSWORD_EMPTY);
            return false;
        }
        if (password.length() >= 8 && StringUtils.isMixedCase(password)) {
            return true;
        }
        if (password.length() < 8) {
            errorMessages.add(PASSWORD_LENGTH);
        } 
        if (!StringUtils.isMixedCase(password)) {
            errorMessages.add(PASSWORD_CASE);
        }
        return false;
    }

    public boolean isSearchValid(String searchby) {
        if (searchby.isEmpty() || searchby == null) {
            errorMessages.add(SEARCHBY_EMPTY);
            return false;
        } else {
            return true;
        }

    }

    // Reservation ID validation
    public boolean isResIDValid(String id) {
        
        if (id.isEmpty() || id == null){
            errorMessages.add(RES_ID_EMPTY);
            return false;
        }

        // Check if id is an int
        try {
            Integer.parseInt(id);
        } catch (NumberFormatException e) {
            errorMessages.add(RES_ID_INVALID);
            return false;
        }
        
        return true;
    }

    // Checkin validation
    public boolean isDateValid(String checkin, String checkout) {
        Date cin = null;
        Date cout = null;
        // Check if dates not entered
        try {
            cin = Date.valueOf(checkin);
            cout = Date.valueOf(checkout);
        } catch (IllegalArgumentException e) {
            errorMessages.add(DATES_EMPTY);
            return false;
        }
        if (!cin.before(cout)) {
            errorMessages.add(DATES_INVALID);
            return false;
        }
            return true;
    }

    
}
