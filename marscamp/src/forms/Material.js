import React, { useState } from 'react';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';
import Container from '@material-ui/core/Container';
import KeyboardArrowRightIcon from '@material-ui/icons/KeyboardArrowRight'
import CloudUploadIcon from '@material-ui/icons/CloudUpload';
import { Input, makeStyles } from '@material-ui/core';
import TextField from '@material-ui/core/TextField';
import { useHistory } from 'react-router-dom';

const useStyles = makeStyles({
  field: {
    marginTop: 40,
    marginBottom: 20,
    display: 'block',
  },
  input :{
      display :'none'
  },
  sub :{
      marginTop : 20
  }
  
})

export default function Material() {
  const classes = useStyles();
  const history = useHistory();
  const [title, setTitle] = useState('');
  const [details, setDetails] = useState('');
  const [titleError, setTitleError] = useState(false);
  const [detailsError, setDetailsError] = useState(false);
  const type = 'material';
  const timeStamp = new Date();
  console.log(timeStamp);

  const handleSubmit = async (e) => {
    e.preventDefault()
    setTitleError(false)
    setDetailsError(false)

    if (title === '') {
      setTitleError(true)
    }
    if (details === '') {
      setDetailsError(true)
    }
    if (title && details) {
      // await fetch('http://localhost:5000/content/add', {
      //   method: 'POST',
      //   headers: {"Content-type": "application/json"},
      //   body: JSON.stringify({ content, user_id, course_id, type })
      // }).then(() => history.push('/'))
    } 
  }

  return (
    <div>
      <Typography
        variant="h6" 
        color="textSecondary"
        component="h2"
        gutterBottom
        
      >
    
      </Typography>
      
      <form noValidate autoComplete="off" onSubmit={handleSubmit}>
        <TextField className={classes.field}
          onChange={(e) => setTitle(e.target.value)}
          label="Title" 
          variant="outlined" 
          color="secondary" 
          fullWidth
          required
          error={titleError}
        />
        <TextField className={classes.field}
          onChange={(e) => setDetails(e.target.value)}
          label="Message"
          variant="outlined"
          color="secondary"
          multiline
          rows={4}
          fullWidth
          required
          error={detailsError}
        />

        <input
        accept="image/*"
        className={classes.input}
        id="contained-button-file"
        multiple
        type="file"
        />
       <label htmlFor="contained-button-file">
        <Button
         variant="outlined" 
         color="secondary"
         component="span"
         startIcon={<CloudUploadIcon/>}
        >
          Upload Material
        </Button>
       </label>
       <div>
        <Button className={classes.sub}
          type="submit" 
          color="secondary" 
          variant="contained"
          endIcon={<KeyboardArrowRightIcon />}>
          Post
        </Button>
       </div>
        
      </form>

      
    </div>
  )
}














