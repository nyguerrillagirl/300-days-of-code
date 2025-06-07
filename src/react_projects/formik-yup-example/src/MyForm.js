import React from "react";
import { useFormik } from "formik";
import * as Yup from "yup";

const MyForm = () => {
  // Define validation schema using Yup
  const validationSchema = Yup.object({
    name: Yup.string().required("Name is required"),
    email: Yup.string().email("Invalid email format").required("Email is required"),
    password: Yup.string().min(6, "Password must be at least 6 characters").required("Password is required"),
  });

  // Initialize Formik
  const formik = useFormik({
    initialValues: {
      name: "",
      email: "",
      password: "",
    },
    validationSchema: validationSchema,
    onSubmit: (values) => {
      console.log("Form Submitted", values);
    },
  });

  return (
    <form onSubmit={formik.handleSubmit}>
      <div>
        <label>Name</label>
        <input type="text" name="name" value={formik.values.name} onChange={formik.handleChange} />
        {formik.errors.name && <div style={{ color: "red" }}>{formik.errors.name}</div>}
      </div>

      <div>
        <label>Email</label>
        <input type="email" name="email" value={formik.values.email} onChange={formik.handleChange} />
        {formik.errors.email && <div style={{ color: "red" }}>{formik.errors.email}</div>}
      </div>

      <div>
        <label>Password</label>
        <input type="password" name="password" value={formik.values.password} onChange={formik.handleChange} />
        {formik.errors.password && <div style={{ color: "red" }}>{formik.errors.password}</div>}
      </div>

      <button type="submit">Submit</button>
    </form>
  );
};

export default MyForm;