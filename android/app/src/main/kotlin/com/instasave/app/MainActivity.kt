package com.instasave.app

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import android.content.Intent.FLAG_ACTIVITY_NEW_TASK

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {


        if (intent.getIntExtra("org.chromium.chrome.extra.TASK_ID", -1) == this.taskId) {
            this.finish()
            intent.addFlags(FLAG_ACTIVITY_NEW_TASK);
            startActivity(intent);
        }
        super.onCreate(savedInstanceState)
    }
}

//    private var sharedData: String = ""
//
//    override fun onCreate(
//        savedInstanceState: Bundle?
//    ) {
//        super.onCreate(savedInstanceState)
//        handleIntent()
//    }
//
//    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
//        super.configureFlutterEngine(flutterEngine)
//        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,
//            "com.tnorbury.flutterSharingTutorial").setMethodCallHandler { call, result ->
//            if (call.method == "getSharedData") {
//                handleIntent()
//                result.success(sharedData)
//                sharedData = ""
//            }
//        }
//    }
//
//
//    private fun handleIntent() {
//        // intent is a property of this activity
//        // Only process the intent if it's a send intent and it's of type 'text'
//        if (intent?.action == Intent.ACTION_SEND) {
//            if (intent.type == "text/plain") {
//                intent.getStringExtra(Intent.EXTRA_TEXT)?.let { intentData ->
//                    sharedData = intentData
//                }
//            }
//        }
//    }





