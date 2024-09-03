<?php
session_start();
include_once "./config.php";

if (isset($_SESSION['uniqueId']) && isset($_POST['incoming_id'])) {
    $outgoing_id = $_SESSION['uniqueId'];
    $incoming_id = mysqli_real_escape_string($con, $_POST['incoming_id']);
    $output = "";
    // Use prepared statements to prevent SQL injection
    $sql = "SELECT * FROM chat 
            WHERE (outgoing_msg_id = ? AND incoming_msg_id = ?)
            OR (outgoing_msg_id = ? AND incoming_msg_id = ?)";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("ssss", $outgoing_id, $incoming_id, $incoming_id, $outgoing_id);
    $stmt->execute();

    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            // Sanitize and escape HTML output
            $message = htmlspecialchars($row['message'], ENT_QUOTES, 'UTF-8');

            if ($row['outgoing_msg_id'] == $outgoing_id) {
                $output .= '
                    <div class="chat outgoing">
                        <div class="details">
                            <p>' . $message . '</p>
                        </div>
                    </div>
                ';
            } else {
                $output .= '
                    <div class="chat incoming">
                        <div class="details">
                            <p>' . $message . '</p>
                        </div>
                    </div>
                ';
            }
        }
    } else {
        $output .= '<div class="text">No messages are available. Once you send messages, they will appear here.</div>';
    }

    echo $output;

    $stmt->close();
} else {
    header('location: ../sign-in.php');
}
?>
