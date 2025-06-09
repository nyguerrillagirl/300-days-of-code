import React, {useEffect} from "react";
import { useFormik } from "formik";
import {
  Box,
  Button,
  FormControl,
  FormErrorMessage,
  FormLabel,
  Heading,
  Input,
  Select,
  Textarea,
  VStack,
} from "@chakra-ui/react";
import * as Yup from 'yup';
import FullScreenSection from "./FullScreenSection";
import useSubmit from "../hooks/useSubmit";
import {useAlertContext} from "../context/alertContext";


const LandingSection = () => {

  const {isLoading, response, submit} = useSubmit();
  const { onOpen } = useAlertContext();

  
  const validationSchema = Yup.object({
       firstName: Yup.string()
                    .required("First Name is required")
                    .min(4, "First name must be at least 4 characters"),
       email:     Yup.string()
                    .email("Invalid email")
                    .required("Email is required"),
      type:      Yup.string()
                    .oneOf(["hireMe", "openSource", "other"], "Invalid type of enquiry"),
       comment: Yup.string()
                    .required("Comment is required")
                    .min(10, "Comment must be at least 10 characters")
     });
    

  const formik = useFormik({
    initialValues: {firstName: "", email: "", type: "hireMe", comment: ""},
    onSubmit: (values) => {
      //alert(JSON.stringify(values, null, 2));
      // We simulate sending a request to some backend API
      // 50% of the time it will succeed, 50% of the time it will fail
      // disable default form submission
      
      submit("/api/contact", values)
        .then(() => {
            onOpen(response.type, response.message);
          } 
        )
        .catch((error) => {
          console.error("Submission error:", error);
          onOpen(
            "error",
            "An unexpected error occurred. Please try again later."
          );

        });
     formik.resetForm(); 
    },
    validationSchema: validationSchema,
  });

  return (
    <FullScreenSection
      isDarkBackground
      backgroundColor="#512DA8"
      py={16}
      spacing={8}
    >
      <VStack w="1024px" p={32} alignItems="flex-start">
        <Heading as="h1" id="contactme-section">
          Contact me
        </Heading>
        <Box p={6} rounded="md" w="100%">
            <form onSubmit={formik.handleSubmit}>
              <VStack spacing={4}>
                <FormControl isInvalid={formik.touched.firstName && !!formik.errors.firstName}>
                  <FormLabel htmlFor="firstName">Name</FormLabel>
                  <Input
                    id="firstName"
                    name="firstName"
                    placeholder="Enter your first name"
                    onChange={formik.handleChange}
                    onBlur={formik.handleBlur}
                    value={formik.values.firstName}
                  />
                  <FormErrorMessage>
                    {formik.errors.firstName}
                  </FormErrorMessage>
                </FormControl>
                <FormControl isInvalid={formik.touched.email && !!formik.errors.email}>
                  <FormLabel htmlFor="email">Email Address</FormLabel>
                  <Input
                    id="email"
                    name="email"
                    type="email"
                    placeholder="Enter your email address"
                    onChange={formik.handleChange}
                    onBlur={formik.handleBlur}
                    value={formik.values.email}
                  />
                  <FormErrorMessage>{formik.errors.email}</FormErrorMessage>
                </FormControl>
                <FormControl>
                  <FormLabel htmlFor="type">Type of enquiry</FormLabel>
                  <Select id="type" name="type" color="white" bg="#512DA8" fontWeight="normal"                     
                      onChange={formik.handleChange}
                      value={formik.values.type}
                       onBlur={formik.handleBlur}>
                    <option value="hireMe"  style={{backgroundColor:"#512DA8"}}>Freelance project proposal</option>
                    <option value="openSource" style={{backgroundColor:"#512DA8"}}>
                      Open source consultancy session
                    </option>
                    <option value="other" style={{backgroundColor:"#512DA8"}}>Other</option>
                  </Select>
                </FormControl>
                <FormControl isInvalid={formik.touched.comment && !!formik.errors.comment}>
                  <FormLabel htmlFor="comment">Your message</FormLabel>
                  <Textarea
                    id="comment"
                    name="comment"
                    height={250}
                    placeholder="Enter your message here"
                    onChange={formik.handleChange}
                    onBlur={formik.handleBlur}
                    value={formik.values.comment}

                  />
                  <FormErrorMessage>{formik.errors.comment}</FormErrorMessage>
                </FormControl>
                <Button type="submit" colorScheme="purple" width="full" disabled={isLoading}>
                  {isLoading ? "Processing..." : "Submit"}
                </Button>
                
              </VStack>
            </form>

        </Box>
      </VStack>
    </FullScreenSection>
  );
};

export default LandingSection;
