package org.jboss.as.quickstarts;

import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

public enum ApplicationProperties {
    INSTANCE;

    private final Properties properties;

    ApplicationProperties() {
        properties = new Properties();
        try {
            properties.load(getClass().getClassLoader().getResourceAsStream("application.properties"));
        } catch (Throwable e) {
            Logger.getLogger(getClass().getName()).log(Level.WARNING, e.getMessage());
        }
    }

    public String getMessageText() {
        return properties.getProperty("message.text");
    }


}

