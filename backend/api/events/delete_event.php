<?php
        require_once "../../config.php";
        require_once "../../api_utils.php";
    if(validate_request("DELETE", array("event_id"))) {
        $event_id = $_GET["event_id"];
        $query = "DELETE FROM `events` WHERE `event_id` = ?;";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("i", $event_id);
        if($stmt->execute()) {
            http_response_code(200);
        } else {
            echo $stmt->error;
            echo "<img src='https://http.cat/500'>";
            http_response_code(500);
        }
    } else {
        echo "<img src='https://http.cat/400'>";
        http_response_code(400);
    }
