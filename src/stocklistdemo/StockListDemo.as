/*
Copyright 2013 Weswit s.r.l.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
package stocklistdemo
{
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import qnx.fuse.ui.text.Label;
    
    import com.lightstreamer.as_client.LSClient;
    import com.lightstreamer.as_client.NonVisualTable;
    import com.lightstreamer.as_client.events.NonVisualItemUpdateEvent;
    import com.lightstreamer.as_client.events.StatusChangeEvent;
    import com.lightstreamer.as_client.ConnectionInfo;
    import com.lightstreamer.as_client.ConnectionPolicy;
    
    [SWF(height="1280", width="768", frameRate="60",backgroundColor="#FFFFFF")]   
    
    public class StockListDemo extends Sprite
    {
        
        // Address of Lightstreamer Server
        private var host:String = "push.lightstreamer.com"; 
        private var port:uint = 80;
        private var protocol:String = "http";
        
      
        
        
        private var statusLabel:Label = new Label();
        private var nameLabel:Label = new Label();
        private var priceLabel:Label = new Label();
        
        public function StockListDemo()
        {
             // support autoOrients
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
             
            //Initialize the UI
            initializeUI();
            
            initializePush();
        }
        
        private function initializeUI():void
        {
            
            statusLabel.width = 400;
            statusLabel.x = 0;
            statusLabel.y = 10;
            statusLabel.text = "Waiting";
            addChild(statusLabel); 
            
            
            
            nameLabel.width = 400;
            nameLabel.x = 0;
            nameLabel.y = statusLabel.height+10;
            nameLabel.text = "Waiting";
            addChild(nameLabel);      
             
            
            
            priceLabel.width = 100;
            priceLabel.x = nameLabel.width+10;
            priceLabel.y = statusLabel.height+10;
            priceLabel.text = "0";
            addChild(priceLabel); 
            
        }
        
        private function initializePush():void {
            var client:LSClient =  new LSClient();
            client.addEventListener(StatusChangeEvent.STATUS_CHANGE,onStatusChange);
            var cInfo:ConnectionInfo = new ConnectionInfo();
            cInfo.server = host;
            cInfo.adapterSet = "DEMO";
            cInfo.controlPort = port;
            cInfo.port = port;
            cInfo.controlProtocol = protocol;
            cInfo.protocol = protocol;
            
            var cPolicy:ConnectionPolicy = new ConnectionPolicy();
            
            client.openConnection(cInfo,cPolicy);
        
            var nonVisualTable:NonVisualTable = new NonVisualTable(["item2"],["stock_name","last_price"],"MERGE");
            nonVisualTable.dataAdapter = "QUOTE_ADAPTER";
            nonVisualTable.snapshotRequired = true;
            nonVisualTable.addEventListener(NonVisualItemUpdateEvent.NON_VISUAL_ITEM_UPDATE,onChange);
            //subscribe the table
            client.subscribeTable(nonVisualTable);
        }
        
        public function onChange(evt:NonVisualItemUpdateEvent):void {
            
            if (evt.isFieldChanged("stock_name")) {
                nameLabel.text = evt.getFieldValue("stock_name");
            }
            if (evt.isFieldChanged("last_price")) {
                priceLabel.text = evt.getFieldValue("last_price");
            }
       }       
      
       public function onStatusChange(e:StatusChangeEvent):void {
           if (e.status == LSClient.DISCONNECTED) {
               statusLabel.text = "Disconnected";
           } else if (e.status == LSClient.CONNECTING) {
               statusLabel.text = "Connecting";
           } else if (e.status == LSClient.POLLING) {
               statusLabel.text = "Polling";
           } else if (e.status == LSClient.STREAMING) {
               statusLabel.text = "Streaming";
           } else if (e.status == LSClient.STALLED) {
               statusLabel.text = "Stalled";
           }
       }
    }
}
