<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- ... (bagian head tetap sama) ... -->
    <style>
        body {
            display: flex;
            flex-direction: column;
            height: 100vh;
            margin: 0;
            background-color: #0d0c0c;
        }

        header {
            background-color: #0d0c0c;
            color: #fff;
            padding: 10px;
            border-bottom: 2px solid #333;
            height: 74px;
        }

        .logo {
            display: inline-block;
            margin-right: 20px;
            color: #ffffff;
            text-decoration: none;
            position: relative;
            left: 20px;
        }

        nav {
            display: flex;
            height: 5px;
        }

        nav a {
            position: relative;
            color: #fff;
            text-decoration: none;
            margin-right: 2%;
            font-size: 25px;
            color: #a29999;
            top: -46px;
            left: 180px;
        }

        .search-box {
            display: inline-block;
            position: absolute;
            right: 8%;
            top: 3%;
        }

        .search-container {
            display: flex;
            background-color: #242524;
            opacity: 0.9;
            width: 87%;
            border-radius: 0;
            border: 2px solid #1f1d2a;
            box-sizing: border-box;
            margin-bottom: 5px;
            right: 70%;
            padding: 3%;
        }

        #searchInput {
            background-color: #242524;
            opacity: 0.9;
            width: 95%;
            border-radius: 0;
            border: none;
            color: #fff;
            padding: 4%;
        }

        .search-button {
            position: absolute;
            right: 6%;
            top: 40%;
            border: none;
            background-color: transparent;
            cursor: pointer;
            transition: all 0.25s;
        }

        .search-button:hover {
            opacity: 0.6;
            transition: all 0.25s;
        }

        .Login-button {
            display: inline-block;
            width: 65px;
            height: 60px;
            border-radius: 50%;
            overflow: hidden;
            position: absolute;
            top: 2%;
            right: 3%;
        }
        
        nav a:hover {
        color: #504f4c;
        }

        h1 {
            font-size: 300%;
            font-weight: 100;
            font-family: 'Inria Serif', serif;
            color: #FFEFEF;
            opacity: 0.7;
            position: relative;
            margin: 1%;
            margin-left: 0%;
        }

        p{
            font-size: 100%;
            font-weight: 100%;
            font-family: 'Inria Serif', serif;
            color: #FFEFEF;
            opacity: 0.7;
            position: relative;
            margin: 1%;
            margin-left: 0%;
        }

        .container {
            display: flex;
            order: 2; 
        }

        /* Sidebar Styling */
        .sidebar {
            margin: 0;
            position: fixed;
            padding: 0;
            width:20%;
            height: 100%;
            background-color: #0d0c0c;
        }

        .sidebar a {
            display: block;
            font-size: 120%;
            left: 100px;
            color: rgb(238, 222, 222);
            padding: 16px;
            text-decoration: none;
            position: sticky;
        }

        /* Content Styling */
        .content {
            margin-left: 20%; /* Adjust the margin to match the sidebar width */
            padding: 40px 40px;
            width: 80%;
            height: 90vh;
            overflow: auto;
            flex-grow: 1;
            box-sizing: content-box;
            background-color: #FFEFEF;
        }


        .button {
            position: fixed;
            margin: 0;
            order: 3; 
            padding-top: 1%;
            padding-left: 2%;
        }

        .sidebar a.active {
        background-color: #04AA6D;
        color: white;
        }

        .sidebar a:hover:not(.active) {
            background-color: #555;
            color: white;
        }
        .logout-button {
            background-color: rgb(78, 71, 71);
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            width: 400%;
            cursor: pointer;
            font-size: 15px;
        }
        .logout-button:hover{
            background-color: #555;
            color: #fff;

        }
        td {
        text-align: center;
        }
    </style>
</head>

<body>
    <header>
        <a href="/Home" class="logo">
            <img src="https://i.ibb.co/RzzSCg2/flix.png" alt="AnimeFlix Logo" style="width: 130px; height: 65px;" />
        </a>
        <a href="/Home/profile/" class="Login-button">            
            <img src="https://i.ibb.co/275wkRK/sasuke.png" alt="Login Icon" style="width: 130px; height: 60px;" />
        </a>
    </header>
    
    </div>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <a href="../AnimeManager">Dashboard</a>
            <a href="./ListAnime">List Anime</a>
            <a href="./TambahAnime">TambahAnime</a>
            <a href="./TambahAnimeEpisode">TambahAnimeEpisode</a>
            <div class="button">
                <form method="post" action="/logout">
                    <button type="submit" class="logout-button">logout</button>
                </form>
            </div>
        </div>


        <!-- Content -->
        <div class="content">
            <c:if test="${not empty banyakuser}">
                <tr><h3>Banyak User</h3></tr>
                <tr><h3>${banyakuser}</h3></tr>
            </c:if>
            <table border="1">
                <thead>
                    <tr>
                        <td>Id</td>
                        <td>Judul</td>
                        <td>genre</td>
                        <td>Publisher</td>
                        <td>thumbnail</td>
                        <td>Episode</td>
                        <td>Like</td>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="anime" items="${animeList}">
                        <tr>
                            <td>${anime.animeId}</td>
                            <td>${anime.title}</td>  
                            <td>${anime.genre}</td>
                            <td>${anime.publisher.nama}</td>
                            <td><img src="${anime.thumbnail}" alt="Poster 1" class="poster-img" width="80"> </td>
                            <td><a href="/Home/nonton/${anime.animeId}/eps">Link</a></td>
                            <td>${anime.likes}</td>
                        </tr>
                    </c:forEach>
                    
                </tbody>
            </table>
            
        </div>
    </div>

    <script>
        
    </script>
</body>
</html>