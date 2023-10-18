/**
 * @description       : Dynamic component that shows a geographical map from longitude and latitude fields
 * @author            : Siberian89
 * @group             : 
 * @created on        : 2023-10-18
 * @last modified on  : 2023-10-18
 * @last modified by  : Siberian89
**/
import { LightningElement, api, wire, track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const ERROR_MESSAGE_PARAGRAPH_CLASS = 'slds-align_absolute-center errorMessageTextColor';

export default class MapsFromGeolocationFields extends LightningElement {
    //autopopulated fields
    @api recordId;
    @api objectApiName;
    //fields populated throu builder 
    @api cmpTitle;
    @api errorMessage;
    @api longitudeFieldApiName;
    @api latitudeFieldApiName;
    //runtime generated fields
    @track fields;
    //initializing variable
    errorMessageClass = ERROR_MESSAGE_PARAGRAPH_CLASS;
    mapMarkers = [];

    @wire(getRecord, {recordId: "$recordId", fields: "$fields" })
    wiredRecord({ error, data }) {
        if (data) {
            if(!this.longitudeFieldApiName || !this.latitudeFieldApiName || !data?.fields[this.longitudeFieldApiName]?.value || !data?.fields[this.latitudeFieldApiName]?.value){
                this.handleError('error in fieldApiName definition');
                return;
            }

            const LONGITUDE = data?.fields[this.longitudeFieldApiName]?.value;
            const LATITUDE = data?.fields[this.latitudeFieldApiName]?.value;

            if(!LONGITUDE || !LATITUDE){
                this.handleError('error getting longitude or latitude value');
            }else{
                this.updateMap(LONGITUDE, LATITUDE);
            }
        } else if (error) {
            this.handleError(error);
        }
    }

    connectedCallback() {
        this.fields = [this.objectApiName + '.' + this.longitudeFieldApiName, this.objectApiName + '.' + this.latitudeFieldApiName];
    }

    updateMap(Longitude, Latitude) {
        this.mapMarkers = [{location: { Latitude, Longitude }}];
    }

    handleError(error){
        this.mapMarkers = [];
        console.error(error);
    }

    get showMap() {
        return this.mapMarkers.length > 0;
    }
}