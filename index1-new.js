import { AmplifyClient } from "@aws-sdk/client-amplify";


const client = new AmplifyClient({
    region : "us-east-2",
    credentials: {
        accessKeyId : "AKIAF6BAFJKR45SAWSZ5"
    }
})