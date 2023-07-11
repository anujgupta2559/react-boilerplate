import { AmplifyClient } from "@aws-sdk/client-amplify";


const client = new AmplifyClient({
    region : "us-east-2",
    credentials: {
        accessKeyId : "AKIAF6BAFJKR45SAWSZ5",
        secretAccessKey: "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"
    }
})