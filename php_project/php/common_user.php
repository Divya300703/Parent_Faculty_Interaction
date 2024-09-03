<?php
    function getparentName($con, $uniqueId) {
        $sql = "SELECT fullName FROM signup WHERE uniqueId = '$uniqueId'";
        $sql_query = mysqli_query($con, $sql);
        if(mysqli_num_rows($sql_query) > 0) {
            $row = mysqli_fetch_assoc($sql_query);
            $parentName = $row['fullName'];
            return $parentName;
        }
        return null;
    }
?>
