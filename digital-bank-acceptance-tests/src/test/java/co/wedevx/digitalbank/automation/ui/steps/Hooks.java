package co.wedevx.digitalbank.automation.ui.steps;

import co.wedevx.digitalbank.automation.ui.utils.DBUtils;
import co.wedevx.digitalbank.automation.ui.utils.Driver;

import io.cucumber.java.Scenario;
import org.junit.After;
import org.junit.Before;


import static co.wedevx.digitalbank.automation.ui.utils.Driver.getDriver;

public class Hooks {
    @Before
    public  void establishConnectionToDb (){

        DBUtils.establishConnection();
    }

    @Before
    public void the_user_is_on_dbank_homepage(){

        getDriver().get("https://dbank-qa.wedevx.co/bank/login");
    }

    @After
    public void afterEachScenario(Scenario scenario){
        Driver.takeScreenshot(scenario);
        Driver.closeDriver();
    }
    @After
    public void closeConnectionToDB(){

        DBUtils.closeConnection();
    }
}
