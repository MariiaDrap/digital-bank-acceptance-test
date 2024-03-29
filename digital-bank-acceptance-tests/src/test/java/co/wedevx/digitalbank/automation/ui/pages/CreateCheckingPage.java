package co.wedevx.digitalbank.automation.ui.pages;

import co.wedevx.digitalbank.automation.ui.models.NewCheckingAccountInfo;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;
import java.util.NoSuchElementException;

public class CreateCheckingPage extends BaseMenuPage{

    public CreateCheckingPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(id = "checking-menu")
    private WebElement checkingMenu;

    @FindBy(id = "new-checking-menu-item")
    private WebElement newCheckingMenuItem;

    @FindBy(id = "Standard Checking")
    private WebElement standardCheckingAccountTypeRadioButton;

    @FindBy(id = "Interest Checking")
    private WebElement interestCheckingAccountTypeRadioButton;

    @FindBy(id = "Individual")
    private WebElement individualOwnershipTypeRadioButton;

    @FindBy(id = "Joint")
    private WebElement jointOwnershipTypeRadioButton;

    @FindBy(id = "name")
    private WebElement accountNameTxt;

    @FindBy(id = "openingBalance")
    private WebElement openingBalanceTxtBox;
    @FindBy(id = "newCheckingSubmit")
    private WebElement submit;

    public void createNewChecking(List<NewCheckingAccountInfo> checkingAccountInfoList){
        NewCheckingAccountInfo testDataForOneCheckingAccount = checkingAccountInfoList.get(0);
        checkingMenu.click();
        newCheckingMenuItem.click();

        if(testDataForOneCheckingAccount.getCheckingAccountType().equalsIgnoreCase("Standard Checking")){
            standardCheckingAccountTypeRadioButton.click();
        }
        else if(testDataForOneCheckingAccount.getCheckingAccountType().equalsIgnoreCase("Interest Checking")) {
            interestCheckingAccountTypeRadioButton.click();
        } else{
            throw new NoSuchElementException("Invalid Account Type");
        }

        if (testDataForOneCheckingAccount.getAccountOwnership().equalsIgnoreCase("Individual")) {
            individualOwnershipTypeRadioButton.click();
        } else if (testDataForOneCheckingAccount.getAccountOwnership().equalsIgnoreCase("Joint")) {
            jointOwnershipTypeRadioButton.click();
        }
        else {
            throw new NoSuchElementException("Invalid Ownership type");
        }

        accountNameTxt.sendKeys(testDataForOneCheckingAccount.getAccountName());
        openingBalanceTxtBox.sendKeys(String.valueOf(testDataForOneCheckingAccount.getInitialDepositAmount()));
        submit.click();
    }
}
