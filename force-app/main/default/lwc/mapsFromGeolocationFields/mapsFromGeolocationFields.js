/**
 * @description       : Dynamic component that shows a geographical map from longitude and latitude fields
 * @author            : Siberian89
 * @group             : 
 * @created on        : 2023-10-18
 * @last modified on  : 2023-10-18
 * @last modified by  : Siberian89
**/
import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const ERROR_MESSAGE_PARAGRAPH_CLASS = 'slds-align_absolute-center errorMessageTextColor';

//fields that cannot be retrieved from layout
const DEFAULT_FIELDS = [];

export default class MapsFromGeolocationFields extends LightningElement {
    @api recordId;
    @api cmpTitle;
    @api errorMessage;
    @api longitudeFieldApiName;
    @api latitudeFieldApiName;

    errorMessageClass = ERROR_MESSAGE_PARAGRAPH_CLASS;

    mapMarkers = [];

    @wire(getRecord, {recordId: '$recordId', layoutTypes: ['Full'], modes: ['View'], optionalFields: DEFAULT_FIELDS})
    wiredRecord({ error, data }) {
        if (data) {

            if(!this.longitudeFieldApiName || !this.latitudeFieldApiName){
                this.mapMarkers = [];
                console.error('error in fieldApiName definition');
                return;
            }

            const LONGITUDE = data.fields[this.longitudeFieldApiName].value;
            const LATITUDE = data.fields[this.latitudeFieldApiName].value;

            if(!LONGITUDE || !LATITUDE){
                this.mapMarkers = [];
            }else{
                this.updateMap(LONGITUDE, LATITUDE);
            }

        } else if (error) {
            this.mapMarkers = [];
            console.error(error);
        }
    }

    updateMap(Longitude, Latitude) {
        this.mapMarkers = [{location: { Latitude, Longitude }}];
    }

    get showMap() {
        return this.mapMarkers.length > 0;
    }
}