<?php
session_start();
include_once './config.php';

if (isset($_SESSION['uniqueId']) && isset($_SESSION['role'])) {
    $currentUserId = $_SESSION['uniqueId'];
    $currentUserRole = $_SESSION['role'];
    $result = '';

    // Use prepared statements to prevent SQL injection
    $stmt = $con->prepare("SELECT fullName, email, uniqueId FROM signup WHERE NOT uniqueId = ? AND role = ?");
    $stmt->bind_param("ss", $currentUserId, $roleToSelect);

    if ($currentUserRole == 'teacher') {
        $roleToSelect = 'parent';
    } else {
        $roleToSelect = 'teacher';
    }

    $stmt->execute();
    $result_set = $stmt->get_result();

    if ($result_set->num_rows > 0) {
        while ($row = $result_set->fetch_assoc()) {
            $result .= '
                <a href="chat.php?id=' . $row['uniqueId'] . '" class="user__link">
                    <div class="available__user__section">
                        <div class="available__user__node">
                            <img src="images/user.png" class="user__icon" alt="dummy icon">
                            <div class="available__user__detail">
                                <h4>' . $row['fullName'] . '</h4>
                                <h5>' . $row['email'] . '</h5>
                            </div>
                        </div>
                    </div>
                </a>
            ';
        }
    } else {
        $result = '<p class="text">No user found</p>';
    }

    $stmt->close();
} else {
    header('location: ../sign-in.php');
}

echo $result;
?>
