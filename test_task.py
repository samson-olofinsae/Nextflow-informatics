import pandas as pd
import datatest as dt
import unittest
def setUpModule():
    global df
    with dt.working_directory(__file__):
            df = pd.read_csv('Mutations.tsv',sep='\t')
                

class TestMutation(dt.DataTestCase):
     def test_assert_integer(self):
          self.assertValid(df['ModelM'], int)

     def test_ModelM_range_value_0_to_1(self):
           for row in df['ModelM']:
                 if row < 1:
                       self.assertValid(row,0)
                 if row > 0:
                      self.assertValid (row, 1)

     def test_ModelO_range_value_0_to_1(self):
           for row in df['ModelO']:
                 if row < 1:
                       self.assertValid(row,0)
                 if row > 0:
                      self.assertValid (row, 1)
     def test_ModelS_range_value_0_to_1(self):
           for row in df['ModelS']:
                 if row < 1:
                       self.assertValid(row,0)
                 if row > 0:
                      self.assertValid (row, 1)


     def test_ModelA_range_value_0_to_1(self):
           for row in df['ModelA']:
                 if row < 1:
                       self.assertValid(row,0)
                 if row > 0:
                      self.assertValid (row, 1)


     def test_ModelI_range_value_0_to_1(self):
           for row in df['ModelI']:
                 if row < 1:
                       self.assertValid(row,0)
                 if row > 0:
                      self.assertValid (row, 1)
                      

     def test_ModelC_range_value_0_to_1(self):
           for row in df['ModelC']:
                 if row < 1:
                       self.assertValid(row,0)
                 if row > 0:
                      self.assertValid (row, 1)
      
      
     def test_ModelT_range_value_0_to_1(self):
           for row in df['ModelT']:
                 if row < 1:
                       self.assertValid(row,0)
                 if row > 0:
                      self.assertValid (row, 1)
     def test_ModelH_range_value_0_to_1(self):
           for row in df['ModelH']:
                 if row < 1:
                       self.assertValid(row,0)
                 if row > 0:
                      self.assertValid (row, 1)
     
     def test_ModelE_range_value_0_to_1(self):
           for row in df['ModelE']:
                 if row < 1:
                       self.assertValid(row,0)
                 if row > 0:
                      self.assertValid (row, 1)
     
     def test_ModelR_range_value_0_to_1(self):
           for row in df['ModelR']:
                 if row < 1:
                       self.assertValid(row,0)
                 if row > 0:
                      self.assertValid (row, 1)

     def test_ModelA2_range_value_0_to_1(self):
           for row in df['ModelA2']:
                 if row < 1:
                       self.assertValid(row,0)
                 if row > 0:
                      self.assertValid (row, 1)
     def test_ModelP_range_value_0_to_1(self):
           for row in df['ModelP']:
                 if row < 1:
                       self.assertValid(row,0)
                 if row > 0:
                      self.assertValid (row, 1)
     def test_ModelE2_range_value_0_to_1(self):
           for row in df['ModelE2']:
                 if row < 1:
                       self.assertValid(row,0)
                 if row > 0:
                      self.assertValid (row, 1)

     def test_ModelU_range_value_0_to_1(self):
           for row in df['ModelU']:
                 if row < 1:
                       self.assertValid(row,0)
                 if row > 0:
                      self.assertValid (row, 1)

     def test_ModelT2_range_value_0_to_1(self):
           for row in df['ModelT2']:
                 if row < 1:
                       self.assertValid(row,0)
                 if row > 0:
                      self.assertValid (row, 1)

     def test_ModelC2_range_value_0_to_1(self):
           for row in df['ModelC2']:
                 if row < 1:
                       self.assertValid(row,0)
                 if row > 0:
                      self.assertValid (row, 1)

     def test_ModelS2_range_value_0_to_1(self):
           for row in df['ModelS2']:
                 if row < 1:
                       self.assertValid(row,0)
                 if row > 0:
                      self.assertValid (row, 1)


if __name__ == '__main__':
          unittest.main()
