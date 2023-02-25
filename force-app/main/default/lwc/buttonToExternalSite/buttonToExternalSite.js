/**
 * @description       : Component that expose a button to open an external website
 * @author            : Siberian89
 * @group             : 
 * @created on        : 2023-02-25
 * @last modified on  : 2023-02-25
 * @last modified by  : Siberian89
**/
import { LightningElement, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const BUTTON_CLASS = 'slds-button slds-button_brand defaultDimension';

export default class ButtonToExternalSite extends NavigationMixin(LightningElement) {

    @api buttonLabel;
    @api externalSiteUrl;

    buttonClass = BUTTON_CLASS;

    isUrlEmpty = false;

    connectedCallback(){
        if(!this.externalSiteUrl){
            this.isUrlEmpty = true;
        }
    }

    handleButtonClick(event){
        this.navigateToExternalSite();
    }

    navigateToExternalSite(){
        try{
            if(!this.externalSiteUrl){
                throw new Error('url is empty');
            }
            if(!this.externalSiteUrl.toLowerCase().startsWith('http')){
                throw new Error('url must start with http:// or https://');
            }

            const urlToReach = this.externalSiteUrl.trim().toLowerCase();

            this.dispatchNavitagionEvent(urlToReach);
        }catch(exception){
            console.error(exception);
            this.showNotification('Error',exception.message,'error');
        }
    }

    dispatchNavitagionEvent(urlToReach){
        const navEvtConfig = {
            type: 'standard__webPage',
            attributes: {
                url: urlToReach
            }
        };
        this[NavigationMixin.Navigate](navEvtConfig);
    }

    showNotification(title,message,variant) {
        const toastEvt = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
        });
        this.dispatchEvent(toastEvt);
    }

}