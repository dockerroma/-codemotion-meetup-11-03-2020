package org.jboss.as.quickstarts;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

public enum ApplicationPropertiesConfigurationDirectory {
    INSTANCE;

    private final Properties properties;

    ApplicationPropertiesConfigurationDirectory() {
        properties = new Properties();
        String fileName = System.getProperty("jboss.server.config.dir") + "/my.properties";
        try {
        FileInputStream fis = new FileInputStream(fileName);
            properties.load(fis);
        } catch (Throwable e) {
            Logger.getLogger(getClass().getName()).log(Level.WARNING, e.getMessage());
        }
    }

    public String getMessageText() {
        return properties.getProperty("message.text");
    }


}

