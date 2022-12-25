package controller.servlet;

import entity.Product;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.service.ProductService;
import util.service.impl.ProductServiceImpl;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/products/my-products")
public class MyProductsServlet extends HttpServlet {

    private final ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("exit") != null) {
            if (req.getParameter("exit").equals("true")) {
                req.getSession().removeAttribute("currentUser");
                req.getRequestDispatcher("/WEB-INF/jsp/authorisation.jsp").forward(req, resp);
            }
        }
        User currentUser = (User) req.getSession().getAttribute("currentUser");
        List<Product> listOfProduct = productService.getProductsOfUser(currentUser.getId());
        req.setAttribute("products", listOfProduct);
        req.getRequestDispatcher("/WEB-INF/jsp/my-products.jsp").forward(req, resp);
    }
}
